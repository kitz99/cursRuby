class User < ActiveRecord::Base
  has_many :contributorships
  has_many :projects, :through => :contributorships
end
