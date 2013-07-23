class User < ActiveRecord::Base
  attr_accessible(:username)
  attr_accessible(:password_digest)

  validates_presence_of :username
  validates_presence_of :password

### Add validates_uniqueness_of :username, "message" => "<msg>"

  has_secure_password

  has_many :songs
  has_many :titles
  has_many :verses
end

