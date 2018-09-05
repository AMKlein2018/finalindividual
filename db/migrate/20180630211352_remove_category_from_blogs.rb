class RemoveCategoryFromBlogs < ActiveRecord::Migration[5.2]
  def up
    remove_column :blogs, :category, :string
  end
	

   def down
    add_column :blogs, :category_id, :integer
  end
end
