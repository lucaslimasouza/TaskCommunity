class Task < ActiveRecord::Base

  attr_accessible :name, :done

  belongs_to :list

  validates_presence_of :name


end
