class AddAttachmentThumbToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.has_attached_file :thumb
    end
  end

  def self.down
    drop_attached_file :projects, :thumb
  end
end
