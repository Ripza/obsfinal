class Busqueda < ActiveRecord::Base
  attr_accessible :intension, :palabra
  has_many :tweets
  belongs_to :tweet
  belongs_to :leye
  belongs_to :iniciativa
  belongs_to :evento
end
