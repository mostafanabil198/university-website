class LoginsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new

  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = 'You have succssfully logged in'
      redirect_to root_path
    else
      flash.now[:notice] = 'Wrong email or password'
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "you have successfully loged out"
    redirect_to root_path
  end
end
