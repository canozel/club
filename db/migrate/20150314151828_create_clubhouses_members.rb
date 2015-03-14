class CreateClubhousesMembers < ActiveRecord::Migration
  def change
    create_table :clubhouses_members do |t|
      t.integer :clubhouse_id
      t.integer :member_id
    end
  end
end
