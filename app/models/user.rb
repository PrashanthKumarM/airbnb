class User < ActiveRecord::Base
	  acts_as_authentic
	  has_many :houses, :dependent => :destroy
	  has_many :booking, :dependent => :destroy
end
