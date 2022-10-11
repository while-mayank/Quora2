class AddWebsiteReferencesToBlog < ActiveRecord::Migration[6.1]
  def change
    add_reference :blogs, :website, foreign_key: true
  end
end
