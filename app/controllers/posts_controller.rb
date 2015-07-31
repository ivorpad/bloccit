class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic
    authorize @post
    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error save the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post

    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  private

  def post_params
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    params.require(:post).permit(:title, :body)
=======
    params.require(:post).permit(:title, :body, :image)
>>>>>>> assignment-44-uploading-images
=======
    params.require(:post).permit(:title, :body, :image)
>>>>>>> assignment-44-uploading-images
=======
    params.require(:post).permit(:title, :body, :image)
>>>>>>> assignment-44-uploading-images
  end

end
