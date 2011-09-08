has_magic_columns
===============

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

    class User < ActiveRecord::Base
      has_magic_columns
    end

Add magic columns to your model:

    @bob = User.create(:email => "bob@example.com")
    @bob.magic_columns.create(:name => "first_name")

Supply additional options if you have more specific requirements for your columns:

    @bob.magic_columns.create(:name => "last_name", :is_required => true)
    @bob.magic_columns.create(:name => "birthday", :datatype => :date)
    @bob.magic_columns.create(:name => "salary", :default => "40000", :pretty_name => "Yearly Salary")

The :datatype option supports :check_box_boolean, :date, :datetime, or :integer.

Use your new columns just like you would with any other ActiveRecord attribute:

    @bob.first_name = "Bob"
    @bob.last_name = "Magic!"
    @bob.birthday = Date.today
    @bob.save

Find @bob and inspect him:

    @bob = User.find(@bob.id)
    @bob.first_name	#=> "Bob"
    @bob.last_name	#=> "Magic!"
    @bob.birthday	#=> #<Date: 4908497/2,0,2299161>
    @bob.salary     #=> "40000", this is from :salary having a :default

## Inherited Model

A child can inherit magic columns from a parent. To do this, declare the parent
as having magic columns:

    class Account < ActiveRecord::Base
      has_many :users
      has_magic_columns
    end

And declare the child as having magic columns :through the parent.

    class User < ActiveRecord::Base
      belongs_to :account
      has_magic_columns :through => :account
    end

To see all the magic columns available for a child from its parent:

    @user.magic_columns #=> [#<MagicColumn>,...]
    @user.account.magic_columns #=> [#<MagicColumn>,...]

To add magic columns, go through the parent or child:

    @user.magic_columns.create(...)
    @user.account.magic_columns.create(...)

All children for a given parent will have access to the same magic columns:

    @account = Account.create(:name => "BobCorp")

    @bob = User.create(:name => "bob", :account => @account)
    @bob.magic_columns.create(:name => "salary")
    @bob.salary = "40000"

    @steve = User.create(:name => "bob", :account => @account)
    # no need to add the column again
    @steve.salary = "50000"

To Do
=====

This gem is mostly functional. Here's a short list of things that need to be
done to polish it up:

* Test
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

Thank you to Brandon Keene for his original work making this plugin.
Thank you to the [will_paginate](https://github.com/mislav/will_paginate) gem for iinspiration and code examples for how to test a Rails plugin.
