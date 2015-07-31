class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
=======
    @topic = Topic.new(params.topic_params)
>>>>>>> assignment-44-uploading-images
=======
    @topic = Topic.new(params.topic_params)
>>>>>>> assignment-44-uploading-images
=======
    @topic = Topic.new(params.topic_params)
>>>>>>> assignment-44-uploading-images
    authorize @topic
    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end
  end

  def update
     @topic = Topic.find(params[:id])
     authorize @topic
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
     if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
=======
     if @topic.update_attributes(params.topic_params)
>>>>>>> assignment-44-uploading-images
=======
     if @topic.update_attributes(params.topic_params)
>>>>>>> assignment-44-uploading-images
=======
     if @topic.update_attributes(params.topic_params)
>>>>>>> assignment-44-uploading-images
       redirect_to @topic
     else
       flash[:error] = "Error saving topic. Please try again."
       render :edit
     end
   end

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> assignment-44-uploading-images
=======
>>>>>>> assignment-44-uploading-images
   def topic_params
     require(:topic).permit(:name, :description, :public)
   end

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> assignment-44-uploading-images
=======
>>>>>>> assignment-44-uploading-images
=======
>>>>>>> assignment-44-uploading-images
end
