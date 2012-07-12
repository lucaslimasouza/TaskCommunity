class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar
  mount_uploader :avatar, AvatarUploader

  has_many :lists
  has_many :watches
  has_many :watched_lists, :through => :watches, :source => :list

  def unwatch(list)
	self.watches.where(:list_id => list.id).destroy_all
  end

  def watch(list)
 	watch = self.watches.build
	watch.list_id = list.id
	watch.save!
  end
end
