class Usuario < ActiveRecord::Base
  attr_accessible :contador_seguidores, :creacion_usuario, :cuenta_verificada, :descripcion, :lenguaje_usuario, :nick, :nombre, :usuario_id
   has_many :tweets
end
