class Artikel < ActiveRecord::Base
  belongs_to :user
  has_many :bestellungs

  attr_accessible :comment, :title, :image

  mount_uploader :image, ImageUploader
  validates :title, :image, presence:true
end
