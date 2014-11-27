class Localizacion < ActiveRecord::Base
  attr_accessible :comuna, :provincia, :region  
  belongs_to :tweet
end
