HasMagicColumns
===============

Allows the addition of "magic" columns and attributes on a per model basis.

Installation
============

You need to create table definitions for MagicColumns.

Generate the migration using the included task:

  rake has_magic_columns:db:create
  
Run the standard migrate task to update your schema:

  rake db:migrate
  
You're ready to start using HasMagicColumns!

Example
=======
class Person < ActiveRecord::Base
  has_magic_columns
end

# Create a Person
@bob = Person.create(:email => "bob@example.com")

# Add some MagicColumns
@bob.magic_columns << MagicColumn.create(:name => "first_name")
@bob.magic_columns << MagicColumn.create(:name => "last_name")
@bob.magic_columns << MagicColumn.create(:name => "birthday", :datatype => "date")

# Give @bob some magic...
@bob.first_name = "Bob"
@bob.last_name = "Magic!"
@bob.birthday = Date.today

# Save @bob like normal
@bob.save

# Find @bob and inspect him
@bob = Person.find(@bob.id)
@bob.first_name	#=> "Bob"
@bob.last_name	#=> "Magic!"
@bob.birthday	#=> #<Date: 4908497/2,0,2299161>

Inherit Template Columns
========================
A child can "inherit" magic columns from its parent.  You can use container models to provide a 
column template for contained objects.  For example, an Account has_magic_columns and 
has_many :people.  A Person inherits magic columns from its account:

class Person < ActiveRecord::Base
  belongs_to :account
  has_magic_columns :inherit => :account
end

Children people now all share the columns of their parent account.  You don't need to use these
magic columns on the Account of course.  It's just a convenient and logical way to provide column 
templating.

This is really nice in multi-user, multi-account environments where Accounts can "customize" 
model attributes.


Copyright (c) 2007 Brandon Keene <bkeene AT gmail DOT com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

