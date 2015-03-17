Sinatra Project Template for me
===============================

Ready-to-go set of files for making small Sinatra app.

Combination of:

* slim for template
* sass for CSS
* sinatra-reloader for development
* sinatra-activerecord for models

Usage
-----

    $ git clone https://github.com/yhara/sinatra_project_template myproject
    $ cd myproject
    $ bundle install
    $ rackup -p 4000
    $ open http://localhost:4000/

### Start development

* Edit app.rb for application code
* Edit views/index.slim for view (or add your own \*.slim)
* Edit views/layout.slim for layouts
* Edit views/screen.sass for stylesheet

### How to setup database

    $ bundle exec rake db:create_migration NAME=create_users
    # Edit db/migrate/*.rb
    $ bundle exec rake db:migrate

Migration file example:

```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end
  end
end
```

If you want to use a RDBMS other than SQLite3, edit Gemfile and
config/database.yml.

License
-------

MIT

public/favicon.ico : [famfamfam Silk icons](http://www.famfamfam.com/lab/icons/silk/) (brick.png)

Contact
-------

https://github.com/yhara/sinatra_project_template
