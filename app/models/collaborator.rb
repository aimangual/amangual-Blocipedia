class Collaborator < ActiveRecord::Base
  belongs_to :user
  has_many :wikis, through: :user
end
