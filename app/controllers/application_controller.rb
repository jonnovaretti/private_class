class ApplicationController < ActionController::Base
  helper_method :current_professor, :professor_signed_in?, :current_student, :student_signed_in?

  def current_professor
    @current_professor ||= Professor.find(professor_session) if professor_session
  end

  def current_student
    @current_student ||= Student.find(student_session) if student_session
  end

  def professor_signed_in?
    !!professor_session
  end

  def student_signed_in?
    !!student_session
  end

  private

  def professor_session
    session[:professor_id]
  end

  def student_session
    session[:student_id]
  end
end
