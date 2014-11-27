class Localizacion < ActiveRecord::Base
  attr_accessible :ciudad, :comuna, :pais, :region
  belongs_to:usuario
end
