class StudentMailer < ApplicationMailer
  default from: 'jonn.novaretti@gmail.com'

  def send_invite
    invite = params[:invite]
    @professor = params[:professor]
    @url = student_url identifier: invite.identifier

    mail(to: invite.student_email, subject: 'You were invited to singup on Private Class')
  end
end
