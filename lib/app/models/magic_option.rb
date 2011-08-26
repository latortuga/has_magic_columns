class MagicOption < ActiveRecord::Base
  belongs_to :magic_column
  
  validates_presence_of :value
  validates_uniqueness_of :value, :scope => :magic_column_id
  validates_uniqueness_of :synonym, :scope => :magic_column_id, :if => Proc.new{|this| !this.synonym.nil? and !this.synonym.empty?}
end