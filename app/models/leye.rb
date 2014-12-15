class Leye < ActiveRecord::Base
  attr_accessible :leyes_nombre, :leyes_tema
  has_many :busquedas
end
