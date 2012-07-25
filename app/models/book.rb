class Book < ActiveRecord::Base
  belongs_to :publisher 
  belongs_to :collection
  has_and_belongs_to_many :authors
  attr_accessible :title
end
