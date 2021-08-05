class Student
  class SessionsController < ApplicationController
    def index; end

    def create
      student = Student.find_by(email: session_params[:email])

      if student&.authenticate(session_params[:password])
        session[:student_id] = student.id
        redirect_to student_home_path
      else
        flash[:notice] = 'Email or password invalid'
        render :index
      end
    end

    def destroy
      session[:student_id] = nil

      render :index
    end

    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
end
