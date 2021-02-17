# Preview all emails at http://localhost:3000/rails/mailers/toilet_mailer
class ToiletMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/toilet_mailer/create_confirmation
  def create_confirmation
    ToiletMailer.create_confirmation
  end

end
