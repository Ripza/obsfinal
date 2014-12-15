class Region < ActiveRecord::Base
  attr_accessible :region_nombre
  has_many:provincia
end
