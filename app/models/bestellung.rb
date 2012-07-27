class Bestellung < ActiveRecord::Base
   belongs_to :users
   belongs_to :gruppes
  attr_accessible  :comment, :name, :preis, :speise

  validates  :speise, :preis ,presence: true
end
