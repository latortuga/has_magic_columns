# Always work through the interface MagicAttribute.value
class MagicAttribute < ActiveRecord::Base
  belongs_to :magic_column
  belongs_to :magic_option
  
  def to_s
    (magic_option) ? magic_option.value : value
  end
  
  def before_save
    if option = find_magic_option_for(value)
      unless magic_option and magic_option == option
        self.value = nil
        self.magic_option = option
      end
    elsif magic_column.allow_other
      self.magic_option = nil
    end
  end
  
private

  def find_magic_option_for(value)
    magic_column.magic_options.find(:first,
      :conditions => ["value = ? or synonym = ?", value, value])
  end
end