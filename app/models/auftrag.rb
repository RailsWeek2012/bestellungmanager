class Auftrag < ActiveRecord::Base
   belongs_to :users
   belongs_to :bestellungs
  attr_accessible  :comment, :name, :preis, :speise

  validates :name, :speise, :preis ,presence: true
end
