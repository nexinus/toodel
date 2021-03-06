class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :toilets, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_commit :async_update # Run on create & update
  # after_create :send_welcome_email
  # after_create :subscribe_to_newsletter

  private

  def async_update
    UpdateUserJob.perform_later(self)
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
