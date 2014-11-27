class Usuario < ActiveRecord::Base
	attr_accessible :contador_seguidores, :creacion_usuario, :cuenta_id, :descripcion, :nick, :nombre 
	has_many :tweets, :dependent => :destroy
end
