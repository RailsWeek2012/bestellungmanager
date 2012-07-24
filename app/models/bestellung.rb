class Bestellung < ActiveRecord::Base
    belongs_to :user
    belongs_to :artikel
    has_many :auftrags , :dependent => :destroy
  attr_accessible  :details, :termin ,:title
  validates :title, :details, presence:true

end
