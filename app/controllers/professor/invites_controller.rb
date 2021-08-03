require 'securerandom'

class Professor
  class InvitesController < ApplicationController
    def index
      @invites = Invite.where(professor: current_professor)
                       .paginate(page: params[:page], per_page: 6)
                       .order(created_at: :desc)
    end

    def post
      @professor = current_professor
      @invite = Invite.new(student_email: email_params, professor: @professor, identifier: SecureRandom.uuid)

      respond_to do |format|
        if @invite.save
          StudentMailer.with(professor: @professor, invite: @invite).send_invite.deliver_now
          format.html { redirect_to professor_invites_url, notice: 'Invite was successfully sent.' }
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
