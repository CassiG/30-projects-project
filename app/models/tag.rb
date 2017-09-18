class Tag < ApplicationRecord
  has_many :taggings
  has_many :posts, through: :taggings, :dependent => :destroy
end
