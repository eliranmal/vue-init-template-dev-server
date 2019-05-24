#!/usr/bin/env bash


function usage {
	printf "%s" '
usage
-----

  [env TEMPLATE_PROJECT_DIR="$(npm prefix)"] vue-cli-template-dev-server.sh [<output_dir>] [<output_project_name>] [-h]

 ''
'
}

function info {
    printf "%s%s" "$(usage)" '
overview
--------

  watch source files of a vue.js custom template project, and triggers the vue-cli init to rebuild the project.
  to be used while developing custom templates.


environment
-----------

  TEMPLATE_PROJECT_DIR
    the local path of the vue-init custom template project to watch.
    defaults to "$(npm prefix)".


arguments
---------

  output_dir
    a local path of the desired directory to pour the generated project into.
    the generated project will be created as a child directory of that path.
    defaults to "${TEMPLATE_PROJECT_DIR}/out".

  output_project_name
    a name for the directory of the project that will be generated by vue init.
    defaults to "awesome-vue-app".

 ''
'
}

function main {
	if [[ "$@" =~ '-h' ]]; then
		info
		exit 0
	fi
	validate_os
	setup_environment
	ensure_dependencies
	start "$@"
}

function start {
	local temp_dir
	local expect_file
	local output_dir="${1:-${TEMPLATE_PROJECT_DIR}/out}"
	local output_project_name="${2:-awesome-vue-app}"

	output_dir="$(abs_path "$output_dir")"
	temp_dir="$(create_temp_dir)"
	cleanup_dir_on_exit "$temp_dir"
	expect_file="${temp_dir}/vue-init.exp"

	log ":)"

	log "starting vue init survey"
	start_auto_survey ${output_dir} ${expect_file} ${TEMPLATE_PROJECT_DIR} "${output_project_name}"
	clear; log "output project generated. waiting for changes..."

	fswatch -o "${TEMPLATE_PROJECT_DIR}/template" | while read num; do
		log "change detected"
		log "regenerating output project..."
		start_survey ${output_dir} ${expect_file}
		clear; log "output project generated. waiting for changes..."
	done
}

function setup_environment {
	validate_template_project_dir
	ensure_template_project_dir
}

function ensure_dependencies {
	ensure_fswatch
	ensure_expect
}

function start_auto_survey {
	local work_dir="$1"
	local expect_file="$2"
	local template_project_dir="$3"
	local output_project_name="$4"

	# create a directory to force vue-init to ask about overwriting the directory on the first time
	ensure_dir "${work_dir}/$output_project_name"

	pushd ${work_dir} >/dev/null 2>&1
	# this will generate an expect file, all filled with answers to the vue-init survey questions
	autoexpect -quiet -f ${expect_file} vue init ${template_project_dir} "${output_project_name}"
	popd >/dev/null 2>&1

	# update the generated expect file to suit our needs
	replace_line ${expect_file} 'set timeout -1' 'set timeout 5' # don't wait forever for an answer
	replace_line ${expect_file} 'expect eof' 'interact' # allow the dev server to keep the process running

	# restore execute permissions (they were ruined by the file copy in replace_line)
	chmod u+x ${expect_file}
}

function start_survey {
	local work_dir="$1"
	local expect_file="$2"

	pushd ${work_dir} >/dev/null 2>&1
	${expect_file} >/dev/null 2>&1
	popd >/dev/null 2>&1
}

function validate_template_project_dir {
	if [[ -n "$TEMPLATE_PROJECT_DIR" ]]; then
		if [[ ! -d "$TEMPLATE_PROJECT_DIR" ]]; then
			quit '$TEMPLATE_PROJECT_DIR is not a directory'
		fi
		if ! is_npm_repo "${TEMPLATE_PROJECT_DIR}"; then
			quit '$TEMPLATE_PROJECT_DIR is not an npm project'
		fi
	else
		# we know that npm_host_path will be the default value in case
		# $TEMPLATE_PROJECT_DIR is empty.
		if [[ -z "$(npm_host_path)" ]]; then
			quit 'could not resolve npm host'
		fi
	fi
}

function ensure_template_project_dir {
	TEMPLATE_PROJECT_DIR="${TEMPLATE_PROJECT_DIR:-$(npm_host_path)}"
	TEMPLATE_PROJECT_DIR="${TEMPLATE_PROJECT_DIR:+$(abs_path "$TEMPLATE_PROJECT_DIR")}"
}

function npm_host_path {
	local path
	local npm_prefix="$(npm prefix)"
	if is_npm_repo "$npm_prefix"; then
		printf "%s" "$npm_prefix"
	else
		printf "%s" ""
	fi
}

function is_npm_repo {
	local dir="$1"
	if [[ -f "${dir}/package.json" ]]; then
		return 0
	else
		return 1
	fi
}

function abs_path {
	local path="$1"
	printf "%s" "$(cd "$(dirname "$path")"; pwd)/$(basename "$path")"
}

function ensure_dir {
	local dir="$1"
	if [[ ! -d "$dir" ]]; then
		mkdir -p "$dir"
	fi
}

function create_temp_dir {
	mktemp -d 2>/dev/null || mktemp -d -t 'vue-cli-template-dev-server'
}

function cleanup_dir_on_exit {
	trap 'rm -rf '"$@"' >/dev/null 2>&1 ; log "bye bye!
"' EXIT
}

function replace_line {
	local file="$1"
	local from="$2"
	local to="$3"
	# bsd/macos specific implementation
	sed -e 's/^'"$from"'$/'"$to"'/' "$file" >"${file}.new"
	mv -- "${file}.new" "$file"
	rm -f "${file}.new"
}

function ensure_fswatch {
	if ! hash fswatch 2>/dev/null; then
		log "fswatch is not installed. installing via brew..."
		# bsd/macos specific implementation
		brew install fswatch
	fi
}

function ensure_expect {
	if ! hash expect 2>/dev/null || ! hash autoexpect 2>/dev/null; then
		log "expect or autoexpect are not installed. installing via brew..."
		# bsd/macos specific implementation
		brew install expect
	fi
}

function validate_os {
	if [[ $OSTYPE = "darwin"* ]]; then # mac
		return 0
	elif [[ $OSTYPE = "linux-gnu" ]]; then # linux
		quit 'linux is not supported at the moment, sorry...'
	elif [[ $OSTYPE = "msys" ]]; then # windows (mingw/git-bash)
		quit 'windows is not supported, sorry...'
	fi
}

function log {
	local msg="$1"
	printf "\n[vue-cli-template-dev-server] %s\n" "$msg"
}

function quit {
	local msg="$1"
	if [[ -n "$msg" ]]; then
		log "$msg"'
'
	else
		usage
	fi
	exit 1
}

# DOwn WInd from the SEwage TREatment PLAnt

main "$@"
