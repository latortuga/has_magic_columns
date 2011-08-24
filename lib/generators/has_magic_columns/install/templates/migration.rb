class AddHasMagicColumnsTables < ActiveRecord::Migration
  def self.up
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

  def self.down
    drop_table "magic_columns"
    drop_table "magic_attributes"
    drop_table "magic_options"
    drop_table "magic_column_relationships"
    drop_table "magic_attribute_relationships"
  end
end