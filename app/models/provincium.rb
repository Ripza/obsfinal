class Provincium < ActiveRecord::Base
  attr_accessible :provincia_nombre
  belongs_to :region
  has_many :comunas
end
