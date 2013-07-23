class Title < ActiveRecord::Base
  attr_accessible(:title)
  attr_accessible(:void)
  attr_accessible(:user_id)

  validates_presence_of :title

  belongs_to :user
end
