class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :password, :password_confirmation, length: { minimum: 4 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, :email, :password, :password_confirmation, presence: true

  def authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('lower(email) = ?', email.downcase)
    if user && authenticate(password)
      return user
    else
      return nil
    end
  end
end
