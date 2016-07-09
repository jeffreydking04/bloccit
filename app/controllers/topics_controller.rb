class TopicsController < ApplicationController
  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_create_and_destroy, only: [:new, :create, :destroy]
  before_action :authorize_edit_and_update, only: [:edit, :update]


  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic successfully saved."
      redirect_to(@topic)
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render(:new)
    end 
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic successfully updated."
      redirect_to(@topic)
    else
      flash.now[:alert] = "Error updating topic. Please try again."
      render(:edit)
    end  
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was successfully deleted."
      redirect_to(topics_path)
    else
      flash.now[:alert] = "Error deleting topic.  Please try again."
      render(:show)
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  def authorize_create_and_destroy
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to(topics_path)
    end
  end

  def authorize_edit_and_update
    unless current_user.moderator? || current_user.admin?
      flash[:alert] = "You must be a moderator or admin to do that."
      redirect_to(topics_path)
    end
  end
end
