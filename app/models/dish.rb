class Dish < ApplicationRecord
  # Direct associations

  belongs_to :type_of_food,
             :class_name => "TypeOfCuisine",
             :foreign_key => "type_of_cuisine_id"

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :specialists,
             :through => :bookmarks,
             :source => :venue

  # Validations

end
