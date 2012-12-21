class DropTableParam < ActiveRecord::Migration
  def up
    drop_table :params
  end

  def down
    create_table "params", :force => true do |t|
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "service_id"
    t.string   "param_type"
  end

  end
end
