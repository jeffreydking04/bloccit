class TopicsController < ApplicationController
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
    @topic = Topic.new
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

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
    @topic.name = params[:topic][:name]
    @topic.description = params[:topic][:description]
    @topic.public = params[:topic][:public]

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
end
