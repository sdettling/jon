class Category < ActiveRecord::Base
  attr_accessible :color, :name, :slug
  has_many :projects
end
