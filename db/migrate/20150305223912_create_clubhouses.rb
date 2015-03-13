class CreateClubhouses < ActiveRecord::Migration
  def change
    create_table :clubhouses do |t|
      t.string :name
      t.string :club_president
      t.string :veep 
      t.string :accountant
      t.string :clerk
      t.string :first_permanent_member
      t.string :second_permanent_member
      t.string :third_permanent_member

      t.timestamps
    end
  end
end
