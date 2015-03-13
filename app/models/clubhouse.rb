class Clubhouse < ActiveRecord::Base
  validates :name, :club_president, :veep, :accountant,
            :clerk, :first_permanent_member, :second_permanent_member, :third_permanent_member, presence: true


end
