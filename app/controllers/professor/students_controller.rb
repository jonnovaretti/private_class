class Professor
  class StudentsController < ApplicationController
    def index
      @students = current_professor.students.paginate(page: params[:page], per_page: 10).order(name: :asc)
    end
  end
end
