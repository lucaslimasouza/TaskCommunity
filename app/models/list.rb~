class List < ActiveRecord::Base

  validates_presence_of :name, :status, :user_id

  attr_accessible :name, :status, :user_id
  has_many :tasks, :dependent => :destroy
  belongs_to :user

  accepts_nested_attributes_for :tasks, :allow_destroy => true

  scope :private, where(:status => "private")
  scope :public, where(:status => "public")
end
