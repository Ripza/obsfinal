class Localizacion < ActiveRecord::Base
  attr_accessible :latitud, :longitud, :lugar
  has_many :tweets
end
