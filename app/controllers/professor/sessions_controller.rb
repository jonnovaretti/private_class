class Professor
  class SessionsController < ApplicationController
    def index; end

    def create
      professor = Professor.find_by(email: session_params[:email])

      if professor&.authenticate(session_params[:password])
        session[:professor_id] = professor.id
        redirect_to professor_students_path
      else
        flash[:notice] = 'Email or password invalid'
        render :index
      end
    end

    def destroy
      session[:professor_id] = nil
      render :index
    end

    private

    def session_params
      params.require(:session).permit(:email, :password)
    end
  end
end
