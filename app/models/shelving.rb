class Shelving < ActiveRecord::Base
  belongs_to :selection
  belongs_to :photo
end
