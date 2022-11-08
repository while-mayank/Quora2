class RemoveStatusFromBlogs < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogs, :status, :string
  end
end
