class TasksController < ApplicationController
  include TaskHelper
  layout "task"
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /task
  def index
  	@items = Task.ordered_by_id.paginate(:page => params[:page], :per_page => 10)
  end
  # GET /task/new
  def new
    @items = Task.new
  end
  # POST /task
  def create
   @items = Task.new(task_params)
    respond_to do |format|
      if @items.save
        format.html { redirect_to :action => "index" }
        flash[:notice] = 'Task is created successfully.'
      else
        format.html { render :new }
      end
     end
  end

  def edit

  end
  # Post /task/update
  def update
    respond_to do |format|
      if @items.update(update_task_params)
        format.html { redirect_to :action => "index" }
        flash[:notice] = 'Task was successfully updated.'
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
	
  private 
  # Permitting params.
  def task_params
    task_param = params.require(:task).permit( :title, :user_id, :start_date, :end_date, :status)
    task_param[:status] = params[:task][:status].to_i
    return task_param
  end

  def update_task_params
    task_param = params.require(:task).permit( :status)
    task_param[:status] = params[:task][:status].to_i
    return task_param
  end
  def set_task    
    @items = Task.find_by_id(params[:id])    
  end

end
