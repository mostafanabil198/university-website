class CoursesController < ApplicationController
  skip_before_action :require_user, only: [:index]
  def index
    @course = Course.all
  end
  def new

  end
end
