# Account class tests the case where has_magic_columns is used in a parent-
# child fashion where the Account model has the magic columns and the User
# model inherits them through the associated Account.
class Account < ActiveRecord::Base
  has_many :users
  has_magic_columns
end
