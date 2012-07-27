class Artikel < ActiveRecord::Base
  belongs_to :user
  has_many :gruppes   , :dependent => :destroy

  attr_accessible :comment, :title, :image

  mount_uploader :image, ImageUploader
  validates :title, :image, presence:true
end
