class MagicColumnRelationship < ActiveRecord::Base
  belongs_to :magic_column
  belongs_to :owner, :polymorphic => true
  #belongs_to :extended_model, :polymorphic => true
end
