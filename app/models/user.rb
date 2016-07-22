class User < ActiveRecord::Base
  include BCrypt
  # Remember to create a migration!
  has_many :questions
  has_many :answers

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
