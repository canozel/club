class AddActiveToMembers < ActiveRecord::Migration
  def change
    add_column :members, :active, :boolean, :default => false
  end
end
