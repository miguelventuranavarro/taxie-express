class FavoriteAddress < ActiveRecord::Base
  belongs_to :district
  belongs_to :zone
  belongs_to :user
end
