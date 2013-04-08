class Image < ActiveRecord::Base
  attr_accessible :file, :project_id
  belongs_to :project
  has_attached_file :file
end
