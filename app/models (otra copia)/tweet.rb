class Tweet < ActiveRecord::Base
  attr_accessible :creacion_tweet, :recurso, :tweet_id, :tweet_texto
  belongs_to :usuario
  has_one :localizacion
  has_and_belongs_to_many :hashtags
end
