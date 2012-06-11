class Task < ActiveRecord::Base

  attr_accessible :name, :list_id

  belongs_to :list

  validates_presence_of :name, :list_id
  validates_associated :list

end
