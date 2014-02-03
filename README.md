has_magic_columns
===============

[![Gem Version](https://badge.fury.io/rb/has_magic_columns.png)](http://badge.fury.io/rb/has_magic_columns)

Allows the addition of custom "magic" columns and attributes on a per-model
or per-parent-model basis. This is useful for situations where custom fields are
required for a specific model or for multi-user, multi-account environments where
accounts can customize attributes for subordinate models.

**NOTE**: This plugin is probably not production-ready. While all the described
features work, not all features have been tested. It was originally a Rails 2
plugin written by Brandon Keene and has been updated to a gem with Rails 3
support.

Installation
============

Add to your Gemfile:

    gem "has_magic_columns"

Create the migrations for MagicColumns and migrate:

    rails g has_magic_columns:install
    rake db:migrate

Usage
=====

## Model

Sprinkle a little magic into an existing model:

```ruby
class Person < ActiveRecord::Base
  has_magic_columns
end
```

Add magic columns to your model:

```ruby
@charlie = Person.create(:email => "charlie@example.com")
@charlie.magic_columns.create(:name => "first_name")
```

Supply additional options if you have more specific requirements for your columns:

```ruby
@charlie.magic_columns.create(:name => "last_name", :is_required => true)
@charlie.magic_columns.create(:name => "birthday", :datatype => :date)
@charlie.magic_columns.create(:name => "salary", :default => "40000", :pretty_name => "Yearly Salary")
```

The `:datatype` option supports: `:check_box_boolean`, `:date`, `:datetime`, `:integer`

Use your new columns just like you would with any other ActiveRecord attribute:

```ruby
@charlie.first_name = "Charlie"
@charlie.last_name = "Magic!"
@charlie.birthday = Date.today
@charlie.save
```

Find @charlie and inspect him:

```ruby
@charlie = User.find(@charlie.id)
@charlie.first_name	#=> "Charlie"
@charlie.last_name	#=> "Magic!"
@charlie.birthday	#=> #<Date: 4908497/2,0,2299161>
@charlie.salary     #=> "40000", this is from :salary having a :default
```

## Inherited Model

A child can inherit magic columns from a parent. To do this, declare the parent
as having magic columns:

```ruby
class Account < ActiveRecord::Base
  has_many :users
  has_magic_columns
end
@account = Account.create(:name => "BobCorp")
```

And declare the child as having magic columns :through the parent.

```ruby
class User < ActiveRecord::Base
  belongs_to :account
  has_magic_columns :through => :account
end
@alice = User.create(:name => "alice", :account => @account)
```

To see all the magic columns available for a child from its parent:

```ruby
@alice.magic_columns #=> [#<MagicColumn>,...]
@account.magic_columns #=> [#<MagicColumn>,...]
@alice.account.magic_columns #=> [#<MagicColumn>,...]
```

To add magic columns, go through the parent or child:

```ruby
@alice.magic_columns.create(...)
@account.magic_columns.create(...)
```

All children for a given parent will have access to the same magic columns:

```ruby
@alice.magic_columns.create(:name => "salary")
@alice.salary = "40000"

@bob = User.create(:name => "bob", :account => @account)
# Magic! No need to add the column again!
@bob.salary = "50000"
```

To Do
=====

Here's a short list of things that need to be done to polish up this gem:

* Test other parts of the data model (e.g. magic_attributes, magic_options)
* Benchmark and optimize

Maintainers
===========

* Drew Ulmer ([latortuga](http://github.com/latortuga))
* Nicholas Zielinski ([zieski](http://github.com/zieski))

Contribute
==========
See the [CONTRIBUTORS guide](https://github.com/latortuga/has_magic_columns/blob/master/CONTRIBUTORS.md).

Credits
=======

* Thank you to Brandon Keene for his original work making this plugin.
* Thank you to the [will_paginate](https://github.com/mislav/will_paginate) gem for iinspiration and code examples for how to test a Rails plugin.
