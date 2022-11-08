class AddStatusToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :status, :boolean
  end
end
