class Comuna < ActiveRecord::Base
  attr_accessible :comuna_nombre
  belongs_to :provincium
  has_many :usuarios
end
