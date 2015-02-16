class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  after_initialize :init

  def init
    self.login_name ||= self.last_name
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }, allow_blank: true
  has_secure_password
end
