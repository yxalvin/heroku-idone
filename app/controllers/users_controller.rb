class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.name = params['name']
    user.email = params['email']
    user.password = params['password']
    if user.save
    redirect_to users_url, notice: "Thanks for signing up!"
  else redirect_to '/users/new', notice: "Fields incomplete or user exists!"
  end
end

  def index    
  end

  def show
    @user = User.find_by(id: params["id"])

    if @user.present? && @user.id == session["user_id"]
      @tasks = @user.tasks
    else
      redirect_to root_url, notice: "Nice try!"
    end
  end


end
