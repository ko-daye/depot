class Product < ActiveRecord::Base
  validates(:title, :description, :image_url, presence: true)
  validates(:price, numericality: {greater_than_or_equal_to: 0.01})
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'はgif、jpg、png画像のURLでなければなりません'
  }
  validates_length_of :title, minimum: 10, too_short: 'You must 10'
end
