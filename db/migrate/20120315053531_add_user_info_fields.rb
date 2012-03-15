class AddUserInfoFields < ActiveRecord::Migration

  def change
   	add_column :users,	:handle,	:string
    add_column :users,	:tagline,	:string
    add_column :users,	:location,	:string
    add_column :users,	:fb_url,	:string
    add_column :users,	:likes,		:string
    add_column :users,	:dislikes,	:string
    add_column :users,	:enabled,	:boolean,	default: false
  end

end
