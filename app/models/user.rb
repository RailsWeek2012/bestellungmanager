class User < ActiveRecord::Base
  has_many :artikels
  has_many :bestellungs , :dependent => :destroy
  has_many :auftrags   ,   :dependent =>  :destroy

  has_secure_password

  attr_accessible :name, :email, :password_digest, :vorname ,
                  :password, :password_confirmation

  attr_protected :admin

  validates :email,
             format: /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
             uniqueness: true
  validates :name, :vorname, :email, presence:true


end
