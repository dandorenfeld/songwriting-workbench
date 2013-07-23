class Song < ActiveRecord::Base
  attr_accessible(:date)
  attr_accessible(:title)
  attr_accessible(:content)
  attr_accessible(:priority)
  attr_accessible(:final)
  attr_accessible(:user_id)

  validates_presence_of :content

  belongs_to :user
end

