class Student
  class InvitesController < ApplicationController
    def index
      @invite = Invite.find_by(identifier: params[:identifier])
      @student = Student.new
    end

    def create
      @student = Student.new(student_params)
      @invite = Invite.find_by(student_email: @student.email)

      respond_to do |format|
        if @invite&.still_valid? && @student.save
          format.html { redirect_to @student, notice: 'Student was successfully created.' }
        else
          format.html { render 'index', identifier: @invite.identifier }
        end
      end
    end

    private

    def student_params
      params.require(:student).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
