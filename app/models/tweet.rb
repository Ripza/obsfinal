class Tweet < ActiveRecord::Base
  attr_accessible :creacion_tweet, :mensaje_id, :recurso, :texto
  belongs_to :usuario
  has_and_belongs_to_many :hashtags
  belongs_to :localizacion
end
