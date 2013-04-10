class Project < ActiveRecord::Base
  attr_accessible :category_id, :description, :slug, :title, :kind, :thumb, :images_attributes

  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images
  
  has_attached_file :thumb, :default_url => "/images/:style/missing.png"
end
