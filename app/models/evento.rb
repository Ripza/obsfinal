class Evento < ActiveRecord::Base
  attr_accessible :evento_nombre, :fecha
  has_many :busquedas
end
