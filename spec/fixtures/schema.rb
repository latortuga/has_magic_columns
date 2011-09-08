ActiveRecord::Schema.define do

  create_table "users", :force => true do |t|
    t.column "name",       :text
    t.column "account_id", :integer
  end

  create_table "accounts", :force => true do |t|
    t.column "name",       :text
  end

  create_table "people", :force => true do |t|
    t.column "name",       :text
  end


  # Has Magic Columns migration generator output

  create_table :magic_columns do |t|
    t.column :name,           :string
    t.column :pretty_name,    :string
    t.column :datatype,       :string, :default => "string"
    t.column :default,        :string
    t.column :is_required,    :boolean, :default => false
    t.column :include_blank,  :boolean, :default => false
    t.column :allow_other,    :boolean, :default => true
    t.column :created_at,     :datetime
    t.column :updated_at,     :datetime
  end
  
  create_table :magic_attributes do |t|
    t.column :magic_column_id, :integer
    t.column :magic_option_id, :integer
    t.column :value, :string
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
  create_table :magic_options do |t|
    t.column :magic_column_id, :integer
    t.column :value, :string
    t.column :synonym, :string
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
  create_table :magic_column_relationships do |t|
    t.column :magic_column_id, :integer
    t.column :owner_id, :integer
    t.column :owner_type, :string
    t.column :created_at, :datetime
    t.column :updated_at, :datetime
  end
  
  create_table :magic_attribute_relationships do |t|
    t.column :magic_attribute_id, :integer
    t.column :owner_id, :integer
    t.column :owner_type, :string
  end   

end
