# Sinatra Project Template for me

Ready-to-go set of files for making small Sinatra app.

Combination of:

* [slim](https://rubygems.org/gems/slim) for template
* [sass](https://rubygems.org/gems/sass) for CSS
* [sinatra-activerecord](https://rubygems.org/gems/sinatra-activerecord) for models
* [rspec](https://rubygems.org/gems/rspec) + [capybara](https://rubygems.org/gems/capybara) for testing
  * Includes setup for `js: true` using headless chrome

## Usage

    $ git clone https://github.com/yhara/sinatra_project_template myproject
    $ cd myproject
    $ bundle install

Scaffold-like example is included. To try this:

    $ bundle exec rake db:migrate
    $ rackup -p 4000
    $ open http://localhost:4000/books/

To create your own table definition:

    $ bundle exec rake db:create_migration NAME=create_users

To run test:

    $ bundle exec rspec

### Directories

- app/
  - main.rb : Entry point of the app. Includes settings for Sinatra
  - flash.rb : Minimalistic implementation of `flash`
  - controllers/ : Contains
  - models/ : Contains ActiveRecord models
  - views/
    - layout.slim
    - screen.sass
- spec/
  - models/ : Tests for models
  - system/ : System test using capybara
  - spec_helper.rb

## License

MIT

public/favicon.ico : [famfamfam Silk icons](http://www.famfamfam.com/lab/icons/silk/) (brick.png)

## Contact

https://github.com/yhara/sinatra_project_template/issues
