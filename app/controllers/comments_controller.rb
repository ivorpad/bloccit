class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    authorize @comment
 end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.new(params.require(:comment).permit(:body))
    @comment.user = current_user
    @topic = @comment.post.topic
    authorize @comment

    if @comment.save
      redirect_to [@topic, @comment.post]
    else
      flash[:error] = 'Error creating comment. Please try again.'
      render 'posts/show'
    end
  end

  def destroy
   @post = Post.find(params[:post_id])
   @topic = @post.topic
   @comment = @post.comments.find(params[:id])

   authorize @comment
   if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@post.topic, @post]
   else
     flash[:error] = "Comment couldn't be deleted. Try again."
     redirect_to [@post.topic, @post]
   end
 end

end