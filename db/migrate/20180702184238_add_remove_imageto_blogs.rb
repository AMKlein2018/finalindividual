class AddRemoveImagetoBlogs < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :remove_image, :string
  end
end
