class Article < ApplicationRecord
  belongs_to :book
  belongs_to :creator
  belongs_to :seller
end
