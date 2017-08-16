class TasksController < ApplicationController
  before_action :require_login

  def require_login
    @user = User.find_by(id: session[:user_id])
    if @user.blank?
      redirect_to root_url, notice: "You need to login first."
    end
  end

  def index
  end

  def show
    @date = params["date"]
    @tasks = Task.where(date: @date,user_id:@user.id).all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find_by(id: params["id"])
    if @task.user_id!=@user.id
      redirect_to root_url, notice: "Access Denied"
    else
      @date = @task.date
    end
  end

  def update
    t = Task.find_by(id: params["id"])
    t.name = params["name"]
    t.description = params["description"]
    t.date = params["date"]
    t.hour = params["time"]["written_on(4i)"].to_i
    t.minute = params["time"]["written_on(5i)"].to_i
    t.importance = params["importance"]
    if t.save
      redirect_to "/tasks/#{params[:date]}", notice: 'Task successfully updated.'
    else
      redirect_to "/tasks/#{params[:date]}", notice: 'Task update failed. Please fill all required feilds.'
    end 
    
  end

  def create
    t = Task.new
    t.name = params["name"]
    t.description = params["description"]
    t.date = params["date"]
    t.user_id=@user.id
    t.hour = params["time"]["written_on(4i)"]
    t.minute = params["time"]["written_on(5i)"]
    t.importance = params["importance"]
    if t.save
      redirect_to "/tasks/#{params[:date]}", notice: 'Task successfully created.'
    else
      redirect_to "/tasks/#{params[:date]}", notice: 'Task creation failed. Please fill all required feilds.'
    end 
  end

  def destroy
    task = Task.find_by(id: params["id"])
    date = task.date
    task.destroy
    redirect_to "/tasks/#{date}",  notice: 'Task successfully deleted!'
  end

end
