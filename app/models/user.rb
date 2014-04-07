class User < ActiveRecord::Base
  
  validates :email, presence: true, uniqueness: true, length: { minimum: 8 } 
  validates_presence_of :name, :lastname, :password
  validates_length_of :name, :minimum => 3 , :maximum => 255
  validates_length_of :lastname, :minimum => 3 , :maximum => 255
  validate :password_pattern
  validate :email_pattern
  
  def password_pattern
    if password.present? && password !~ /^(?=.*[a-z])(?=.*\d)(?=.*(_|[^\w])).+$/
      errors.add :password, "must include at least one one underscore or non-word character and one digit"
    end
  end
  
  def email_pattern
    if email.present? && email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/
      errors.add :email, "must include a vaild email"
    end
  end
  
  has_secure_password
end
