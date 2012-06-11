class List < ActiveRecord::Base

  validates_presence_of :name, :status, :user_id
  validates_associated :tasks

  attr_accessible :name, :status, :user_id
  has_many :tasks
  belongs_to :user

  scope :private, where(:status => "private")
  scope :public, where(:status => "public")
end
