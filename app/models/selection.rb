class Selection < ActiveRecord::Base
  belongs_to :album

  has_many: shelvings
  has_many: photos, :through => shelvings

  accepts_nested_attributes_for :photos

end
