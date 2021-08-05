class Student
  class InvitesController < ApplicationController
    def index
      @invite = Invite.find_by(identifier: params[:identifier])
      @student = Student.new
    end

    def create
      @invite = Invite.find_by(student_email: student_params[:email])
      @student = new_student(student_params, @invite.professor)

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

    def new_student(params, professor)
      Student.new(name: params[:name],
                  email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation],
                  professor: professor)
    end
  end
end
