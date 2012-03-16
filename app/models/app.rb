class App < ActiveRecord::Base

attr_accessible :name, :version, :tags, :image_url,
				:description, :longdescription, :enabled

  validates :name,              presence: true, length: { maximum: 50 }
  validates	:version,			presence: true
  validates	:tags,				presence: true
  validates	:image_url,			presence: true  
  validates :description,       presence: true, length: { maximum: 50 }
  validates :longdescription,  	presence: true, length: { maximum: 200 }
  validates :enabled,           presence: true

end
