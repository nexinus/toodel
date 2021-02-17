class ToiletMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.toilet_mailer.create_confirmation.subject
  #
  def create_confirmation
    @toilet = params[:toilet]

    mail(
      to:       @toilet.user.email,
      subject:  "Toilet #{@toilet.name} created!"
    )
  end
end
