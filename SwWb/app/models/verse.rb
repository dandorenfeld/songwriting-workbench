class Verse < ActiveRecord::Base
  attr_accessible(:date)
  attr_accessible(:tag)
  attr_accessible(:content)
  attr_accessible(:user_id)

  validates_presence_of :content

  belongs_to :user
end
