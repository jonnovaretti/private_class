require 'securerandom'

class Professor
  class InvitesController < ApplicationController
    def index; end

    def post
      @professor = current_professor
      @invite = Invite.new(student_email: email_params, professor: @professor, identifier: SecureRandom.uuid)

      respond_to do |format|
        result_email_send = StudentMailer.with(professor: @professor, invite: @invite).send_invite.deliver_now

        if result_email_send && @invite.save
          format.html { redirect_to professor_students_path, notice: 'Invite was successfully sent.' }
        else
          format.html { render :index, status: :unprocessable_entity }
        end
      end
    end

    private

    def email_params
      params.require(:invite).permit(:student_email)[:student_email]
    end
  end
end
