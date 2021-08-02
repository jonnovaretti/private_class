class ApplicationController < ActionController::Base
  helper_method :current_professor, :professor_signed_in?

  def current_professor
    @current_professor ||= Professor.find(professor_session) if professor_session
  end

  def professor_signed_in?
    !!professor_session
  end

  private

  def professor_session
    session[:professor_id]
  end
end
