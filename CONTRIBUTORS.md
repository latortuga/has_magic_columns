# Pull Requests

We love pull requests. Here's a quick guide:

1. Fork the repo.

2. Run the tests. We only take pull requests with passing tests, and it's great
to know that you have a clean slate: `bundle && rake`

3. Add a test for your change. Only refactoring and documentation changes
require no new tests. If you are adding functionality or fixing a bug, we need
a test!

4. Make the test pass.

5. Push to your fork and submit a pull request.


At this point you're waiting on us. We'll be in contact as soon as we are able.
We may suggest some changes, improvements, alternatives.

Some things that will increase the chance that your pull request is accepted,
taken straight from the Ruby on Rails guide:

* Use Rails idioms and helpers
* Include tests that fail without your code, and pass with it
* Update the documentation, the surrounding one, examples elsewhere, guides,
  whatever is affected by your contribution

# Conventions

* Foremost, follow the conventions you see in the source.
* Two spaces, no tabs.
* No trailing whitespace. Blank lines should not have any space.
* Prefer `&&`/`||` over `and`/`or`.
* `MyClass.my_method(my_arg)` not `my_method( my_arg )` or `my_method my_arg`.
* `a = b` instead of `a=b`.
