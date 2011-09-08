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

end
