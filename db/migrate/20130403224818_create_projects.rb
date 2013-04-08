class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :slug
      t.string :type
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end
