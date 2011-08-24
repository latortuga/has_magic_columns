# Has Magic Columns
#
# Copyright (c) 2007 Brandon Keene <bkeene AT gmail DOT com>
#
# Extends @attributes on a per model basis.  Column definitions exist through
# the built-in :magic_columns association.
#
# class Model < ActiveRecord::Base
#   has_magic_columns
# end
#
# @model = Model.create(...) #=> @model.id == 1
# @model.magic_columns << MagicColumn.create(:name => "first_name")
# @model.first_name = "Brandon"
# @model.save
# @model = Model.find(1)
# @model.first_name #=> "Brandon"
module HasMagicColumns # :nodoc:
end
