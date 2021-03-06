class Watch < ActiveRecord::Base

  belongs_to :list
  belongs_to :user

  validates_presence_of :list_id, :user_id
  validates_associated :list, :user

  attr_accessible :list_id, :user_id
end
