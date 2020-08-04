class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def index
    @user = User.find(params[:id])
    if @user.TypeUser == 1
      @teacher = @user.teacher
    else @user.TypeUser == 2
         @student = @user.student

    end
    # a = @student.studentparts.select(:mark).where("part_id = ?",1).first
    # render json: a['mark']
  end


  def new
    @user = User.new

  end

  def create
    @user = User.new user_params
    @user.UserID = auto_increase_id
    if @user.valid?
      session[:user] = @user

      if @user.TypeUser == 1
        redirect_to action: 'new', controller: 'teacher', id: @user.UserID
      else
        redirect_to action: 'new', controller: 'students', id: @user.UserID
      end
    else
      flash[:danger] = 'Invalid User'
      redirect_to action: :new, controller: :users
    end
  end

  def show
    @user = User.find_by_UserID params[:id]
  end



  private

  def user_params
    defaults = {TypeUser: 1}
    params.require(:user).permit :Name, :Phone, :username, defaults, :password, :password_confirmation, :Email, :TypeUser

  end

  def auto_increase_id
    #select max userid
    maxId = User.maximum('UserID')
    maxNumber = maxId.slice(1, maxId.length).to_i
    maxNumber += 1
    format = 'U000000000'
    newId = format.slice(0, 10 - (maxNumber.to_s).length) + maxNumber.to_s

  end
end
