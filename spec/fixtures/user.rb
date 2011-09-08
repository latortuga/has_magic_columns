# User class tests the case where has_magic_columns is used in a parent-
# child fashion where the Account model has the magic columns and the User
# model inherits them through the associated Account.
class User < ActiveRecord::Base
  belongs_to :account
  has_magic_columns :through => :account
end
