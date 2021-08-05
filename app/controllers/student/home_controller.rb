class Student
  class HomeController < ApplicationController
    def index
      @student = current_student
      byebug
    end
  end
end
