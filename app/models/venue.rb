class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :specialties,
             :through => :bookmarks,
             :source => :dish

  # Validations

end
