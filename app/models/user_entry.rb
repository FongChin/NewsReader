class UserEntry < ActiveRecord::Base
  attr_accessible :entry_id, :user_id
  validates :entry_id, :user_id, :presence => true

  belongs_to :user
  belongs_to :entry
end
