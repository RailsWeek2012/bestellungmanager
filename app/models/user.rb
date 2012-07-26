class User < ActiveRecord::Base
  has_many :artikels
  has_many :bestellungs , :dependent => :destroy
  has_many :auftrags   ,   :dependent =>  :destroy
  has_one :authorization , :dependent => :destroy

  attr_accessible :name, :vorname, :email

  attr_protected :admin
  validates :email,
            format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
            uniqueness: true
     validates :name, :vorname ,presence: true
end
