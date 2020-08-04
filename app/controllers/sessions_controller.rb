class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by username: params[:session][:username].downcase
    if user&.authenticate(params[:session][:password])

      log_in user
      if current_user.TypeUser == 0
        redirect_to rails_admin_path
      elsif current_user.TypeUser == 1
        redirect_to teacher_path
      else
        redirect_to students_path
      end
    else
      flash[:danger] = "Invalid username/password combination"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = "You are logged out"
    redirect_to login_path
  end
end
