# contributing guide

first of all, thank you for considering contributing to this project. you're awesome just for reading these words.

there are many ways to contribute, all are welcome; from improving the documentation, fixing bugs and submitting issues,
to writing new features, auditing code reviews and writing tutorials.


## house rules

as a contributor, you're expected generally what a human is (be respectful, considerate, etc.), but you also hold
other responsibilities:

- being open minded is a big part what *open* means when we talk about open source.  
be welcoming to newcomers and encourage diverse new contributors from all backgrounds.
diversity of approaches is what helps us grow.
- create issues for any changes that you wish to make. discuss things transparently and get community feedback.
- ensure platform compatibility before applying a pull request. currently only bsd/mac is supported, but
POSIX-compatible solutions are accepted regardless (and are generally preferred).


## first time here?

if you're unsure where to begin, the [issues page][2] is a good place to start.
the ones labeled with <kbd>[good first issue][1]</kbd> are simpler ones, while issues labeled
<kbd>[help wanted][4]</kbd> typically require greater involvement.

found one that you like? or - even better - have your own ideas for a contribution?

you're ready! hop on!

feel free to reach for help, we all thrive through sharing :smile_cat:


## getting started

1. create your own fork of the repository, and clone it locally.
1. create a new branch off of the master branch, following the conventions [mentioned below][11].
1. make changes to the code. in lieu of formal style guide, be sure to maintain the existing style.
when making commits, please follow the message style [mentioned below][11].
1. test your changes locally.
1. [open a pull request][3] against the 'upstream' repository (this is just a convention to name the remote repository
that another remote repository was forked from). please follow [these conventions][11].

---
TODO


###### conventions

- commit message convention
- branch naming convention
- PR conventions
    - state the change nature, in terms of semver


---
ORIGINAL TEMPLATE


# How to report a bug
### Explain security disclosures first!
At bare minimum, include this sentence:
> If you find a security vulnerability, do NOT open an issue. Email XXXX instead.

If you don’t want to use your personal contact information, set up a “security@” email address. Larger projects might have more formal processes for disclosing security, including encrypted communication. (Disclosure: I am not a security expert.)

> Any security issues should be submitted directly to security@travis-ci.org
> In order to determine whether you are dealing with a security issue, ask yourself these two questions:
> * Can I access something that's not mine, or something I shouldn't have access to?
> * Can I disable something for other people?
>
> If the answer to either of those two questions are "yes", then you're probably dealing with a security issue. Note that even if you answer "no" to both questions, you may still be dealing with a security issue, so if you're unsure, just email us at security@travis-ci.org.

[source: [Travis CI](https://github.com/travis-ci/travis-ci/blob/master/CONTRIBUTING.md)] **Need more inspiration?** [1] [Celery](https://github.com/celery/celery/blob/master/CONTRIBUTING.rst#security) [2] [Express.js](https://github.com/expressjs/express/blob/master/Security.md)

### Tell your contributors how to file a bug report.
You can even include a template so people can just copy-paste (again, less work for you).

> When filing an issue, make sure to answer these five questions:
>
> 1. What version of Go are you using (go version)?
> 2. What operating system and processor architecture are you using?
> 3. What did you do?
> 4. What did you expect to see?
> 5. What did you see instead?
> General questions should go to the golang-nuts mailing list instead of the issue tracker. The gophers there will answer or ask you to file an issue if you've tripped over a bug.

[source: [Go](https://github.com/golang/go/blob/master/CONTRIBUTING.md#filing-issues)] **Need more inspiration?** [1] [Celery](https://github.com/celery/celery/blob/master/CONTRIBUTING.rst#other-bugs ) [2] [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#reporting-bugs) (includes template)

# How to suggest a feature or enhancement
### If you have a particular roadmap, goals, or philosophy for development, share it here.
This information will give contributors context before they make suggestions that may not align with the project’s needs.

> The Express philosophy is to provide small, robust tooling for HTTP servers, making it a great solution for single page applications, web sites, hybrids, or public HTTP APIs.
>
> Express does not force you to use any specific ORM or template engine. With support for over 14 template engines via Consolidate.js, you can quickly craft your perfect framework.

[source: [Express](https://github.com/expressjs/express#philosophy)] **Need more inspiration?** [Active Admin](https://github.com/activeadmin/activeadmin#goals)

### Explain your desired process for suggesting a feature.
If there is back-and-forth or signoff required, say so. Ask them to scope the feature, thinking through why it’s needed and how it might work.

> If you find yourself wishing for a feature that doesn't exist in Elasticsearch, you are probably not alone. There are bound to be others out there with similar needs. Many of the features that Elasticsearch has today have been added because our users saw the need. Open an issue on our issues list on GitHub which describes the feature you would like to see, why you need it, and how it should work.

[source: [Elasticsearch](https://github.com/elastic/elasticsearch/blob/master/CONTRIBUTING.md#feature-requests)] **Need more inspiration?** [1] [Hoodie](https://github.com/hoodiehq/hoodie/blob/master/CONTRIBUTING.md#feature-requests) [2] [Ember.js](https://github.com/emberjs/ember.js/blob/master/CONTRIBUTING.md#requesting-a-feature)

# Code review process
### Explain how a contribution gets accepted after it’s been submitted.
Who reviews it? Who needs to sign off before it’s accepted? When should a contributor expect to hear from you? How can contributors get commit access, if at all?

> The core team looks at Pull Requests on a regular basis in a weekly triage meeting that we hold in a public Google Hangout. The hangout is announced in the weekly status updates that are sent to the puppet-dev list. Notes are posted to the Puppet Community community-triage repo and include a link to a YouTube recording of the hangout.
> After feedback has been given we expect responses within two weeks. After two weeks we may close the pull request if it isn't showing any activity.

[source: [Puppet](https://github.com/puppetlabs/puppet/blob/master/CONTRIBUTING.md#submitting-changes)] **Need more inspiration?** [1] [Meteor](https://meteor.hackpad.com/Responding-to-GitHub-Issues-SKE2u3tkSiH ) [2] [Express.js](https://github.com/expressjs/express/blob/master/Contributing.md#becoming-a-committer)

# Community
If there are other channels you use besides GitHub to discuss contributions, mention them here. You can also list the author, maintainers, and/or contributors here, or set expectations for response time.

> You can chat with the core team on https://gitter.im/cucumber/cucumber. We try to have office hours on Fridays.

[source: [cucumber-ruby](https://github.com/cucumber/cucumber-ruby/blob/master/CONTRIBUTING.md#talking-with-other-devs)] **Need more inspiration?**
 [1] [Chef](https://github.com/chef/chef/blob/master/CONTRIBUTING.md#-developer-office-hours) [2] [Cookiecutter](https://github.com/audreyr/cookiecutter#community)

# BONUS: Code, commit message and labeling conventions
These sections are not necessary, but can help streamline the contributions you receive.

### Explain your preferred style for code, if you have any.

**Need inspiration?** [1] [Requirejs](http://requirejs.org/docs/contributing.html#codestyle) [2] [Elasticsearch](https://github.com/elastic/elasticsearch/blob/master/CONTRIBUTING.md#contributing-to-the-elasticsearch-codebase)

### Explain if you use any commit message conventions.

**Need inspiration?** [1] [Angular](https://github.com/angular/material/blob/master/.github/CONTRIBUTING.md#submit) [2] [Node.js](https://github.com/nodejs/node/blob/master/CONTRIBUTING.md#step-3-commit)

### Explain if you use any labeling conventions for issues.

**Need inspiration?** [1] [StandardIssueLabels](https://github.com/wagenet/StandardIssueLabels#standardissuelabels) [2] [Atom](https://github.com/atom/atom/blob/master/CONTRIBUTING.md#issue-and-pull-request-labels)







[1]: /labels/good%20first%20issue
[2]: /issues
[3]: https://github.com/eliranmal/vue-cli-template-dev-server/compare
[4]: ./labels/help%20wanted