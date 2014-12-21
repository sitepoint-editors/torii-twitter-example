class User < ActiveRecord::Base
  validates :name, presence: true
  
  def generate_token
    self.token = SecureRandom.urlsafe_base64(nil, false)
  end
end
