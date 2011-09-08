# Person class tests the case where has_magic_columns is used on a model
# without the parent-child relationship.
class Person < ActiveRecord::Base
  has_magic_columns
end
