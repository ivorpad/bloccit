class SummariesController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = Summary.new

  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.create_summary(params.require(:summary).permit(:body))

    if @summary.save!
      flash[:notice] = "Summary saved"
      redirect_to [@topic, @post]
    else
      flash[:error] = "Summary was not saved. Try again."
      render :new
    end

  end

  def show
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @summary = @post.summary
  end
end
