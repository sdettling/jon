class Image < ActiveRecord::Base
  attr_accessible :file, :project_id
  belongs_to :project
  has_attached_file :file, :styles => {
      :thumb => "100x100#",
      :slide => "932x697>"
      },
      :default_url => "/images/:style/missing.png"
end
