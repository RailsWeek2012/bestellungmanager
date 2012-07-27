class Gruppe < ActiveRecord::Base
    belongs_to :user
    belongs_to :artikel
    has_many :bestellungs , :dependent => :destroy
  attr_accessible  :details, :termin ,:title
  validates :title, :details, presence:true

end
