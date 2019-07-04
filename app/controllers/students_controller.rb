class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_user, only: [:edit, :update]
  def index
    @student = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "You have successfully updated your profile"
      redirect_to @student
    else
      render 'edit'
    end
  end

  def show
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_user
    if current_user != @student
      flash[:notice] = "you don't have access to this profile to edit"
      redirect_to students_path
    end
  end
end
