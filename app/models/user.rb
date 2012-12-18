class User < ActiveRecord::Base
  has_many :services_users
  has_many :services :through=>:services_users
end
