class Iniciativa < ActiveRecord::Base
  attr_accessible :iniciativa_nombre, :iniciativa_tema
  has_many :busquedas
end
