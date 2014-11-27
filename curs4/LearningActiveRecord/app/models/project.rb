class Project < ActiveRecord::Base
  has_many :contributorships
  has_many :users, :through => :contributorships
end
