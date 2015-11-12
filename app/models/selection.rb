class Selection < ActiveRecord::Base
  belongs_to :album

  has_many :shelvings, dependent: :destroy
  has_many :photos, :through => :shelvings

  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  accepts_nested_attributes_for :photos

  validates :name, presence: true

end
