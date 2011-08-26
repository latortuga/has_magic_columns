has_magic_columns
===============

Allows the addition of custom "magic" columns and attributes on a per-model
or per-parent-model basis. This is useful for situations where custom fields are
required for a specific model or for multi-user, multi-account environments where
accounts can customize attributes for subordinate models.

**NOTE**: This plugin is not production-ready. It was originally a Rails 2
plugin written by Brandon Keene and is being updated to a gem with Rails 3
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

Add has_magic_columns to your model of choice.

    class User < ActiveRecord::Base
      has_magic_columns
    end

Add magic columns to your model

    @bob = User.create(:email => "bob@example.com")
    @bob.magic_columns << MagicColumn.create(:name => "first_name")
    @bob.magic_columns << MagicColumn.create(:name => "last_name")
    @bob.magic_columns << MagicColumn.create(:name => "birthday", :datatype => "date")
    
Give @bob some magic...

    @bob.first_name = "Bob"
    @bob.last_name = "Magic!"
    @bob.birthday = Date.today
    @bob.save

Find @bob and inspect him

    @bob = User.find(@bob.id)
    @bob.first_name	#=> "Bob"
    @bob.last_name	#=> "Magic!"
    @bob.birthday	#=> #<Date: 4908497/2,0,2299161>

## Inherited Model

A child can inherit magic columns from a parent.

    class Account < ActiveRecord::Base
      has_many :users
    end

    class User < ActiveRecord::Base
      belongs_to :account
      has_magic_columns :through => :account
    end

To see all the magic columns available for a child from its parent:

    @user.magic_columns #=> [#<MagicColumn>,...]

or

    @user.account.magic_columns #=> [#<MagicColumn>,...]

To add magic columns, go through the parent or child:

    @user.magic_columns << MagicColumn.create(...)
    @user.account.magic_columns << MagicColumn.create(...)

All children for a given parent will have access to the same magic columns:

    @account = Account.create(:name => "BobCorp")

    @bob = User.create(:name => "bob", :account => @account)
    @bob.magic_columns << MagicColumn.create(:name => "salary")
    @bob.salary = "40000"

    @steve = User.create(:name => "bob", :account => @account)
    # no need to add the column again
    @steve.salary = "50000"

To Do
=====

This gem is not functional yet. Here's a short list of things that need to be
done to polish it up:

* Find and fix unsupported Rails 2 code
* Test
* Flesh out README with examples of how to use inherited magic columns
* Benchmark and optimize

Maintainers
===========

* Drew Ulmer ([latortuga](http://github.com/latortuga))
* Nicholas Zielinski ([zieski](http://github.com/zieski))

Contribute
==========
See the [CONTRIBUTORS guide](https://github.com/latortuga/has_magic_columns/blob/master/CONTRIBUTORS.md).
