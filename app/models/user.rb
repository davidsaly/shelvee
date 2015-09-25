class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :contributions
  has_many :photos, :through => :contributions

  has_many :cooperations
  has_many :albums, :through => :cooperations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
