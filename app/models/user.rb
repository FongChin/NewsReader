class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  validates :username, :token, :presence => true
  validates :password, :length => {:minimum => 6, :allow_nil => true}
  before_validation :generate_token, :on => :create

  has_many :feeds
  has_many :user_feeds
  has_many :favorite_feeds, :through => :user_feeds, :source => :feed


  def self.find_by_credential(user)
    @user = User.find_by_username(user[:username])
    if @user && @user.is_password?(user[:password])
      return @user
    end
    return nil
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def generate_token
    self.token = SecureRandom::urlsafe_base64(16)
  end

  def reset_token!
    self.generate_token
    self.save
  end
end
