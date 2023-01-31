class AddActiveToUserRole < ActiveRecord::Migration[7.0]
  def change
    add_column :user_roles, :active, :boolean, default: false
  end
end
