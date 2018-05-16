class ApplicationsController < ApplicationController
  def index
    @applications = StudentApplication.joins(:student).order('students.name').
        paginate(page: params[:page], per_page: 20)
  end
end
