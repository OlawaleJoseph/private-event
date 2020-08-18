class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_params)

    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to user_path(@user)
    else
      flash.now[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  protected
  def allowed_params
    params.require(:user).permit(:first_name, :last_name, :username)
  end
end
