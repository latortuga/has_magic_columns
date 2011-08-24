has_magic_columns
===============

Allows the addition of custom "magic" columns and attributes on a per-model
or per-parent-model basis. This is useful for situations where custom fields are
required for a specific model or for multi-user, multi-account environments where
accounts can customize attributes for subordinate models.

NOTE: This plugin is in a transitional state. It was originally a Rails 2
plugin written by Brandon Keene and is being update to a gem with Rails 3
support.

Installation
============

Add to your Gemfile:

    gem "has_magic_columns"

Create the migrations for MagicColumns and migrate:

    rake has_magic_columns:db:create
    rake db:migrate
  
Usage
=====

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

Inherit Template Columns
========================

A child can inherit magic columns from its parent. You can use container models
to provide a column template for contained objects. For example:

    class Account < ActiveRecord::Base
      has_many :users
    end

    class User < ActiveRecord::Base
      belongs_to :account
      has_magic_columns :inherit => :account
    end

All Users on a given account will thus inherit the same magic columns.

To Do
=====

This gem is not functional yet. Here's a short list of things that need to be
done to polish it up:

* Find and fix unsupported Rails 2 code
* Add gemspec
* Test
* Flesh out README with examples of how to use inherited magic columns
* Benchmark and optimize

Maintainers
===========

* Drew Ulmer (github.com/latortuga)
* Nicholas Zielinski (github.com/zieski)

Contribute
==========
See github.com/latortuga/has_magic_columns/CONTRIBUTORS.md
