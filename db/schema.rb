ActiveRecord::Schema.define(:version => 20120316173452) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.string   "description"
    t.string   "tags"
    t.string   "image_url"
    t.string   "longdescription"
    t.boolean  "enabled",         :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "scrawls", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "scrawls", ["user_id", "created_at"], :name => "index_scrawls_on_user_id_and_created_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.string   "handle"
    t.string   "tagline"
    t.string   "location"
    t.string   "fb_url"
    t.string   "likes"
    t.string   "dislikes"
    t.boolean  "enabled",         :default => false
  end

  add_index "users", ["email"],           :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"],  :name => "index_users_on_remember_token"

end
