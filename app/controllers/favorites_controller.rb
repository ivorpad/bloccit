class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "Post has been successfully favorited"
      redirect_to [post.topic, post]
    else
      flash[:error] = "Post couldn't be favorited"
      redirect_to post
    end
  end


  def destroy
   # Get the post from the params
   post = Post.find(params[:post_id])
   # Find the current user's favorite with the ID in the params
   favorite = current_user.favorites.find(params[:id])
   authorize favorite
   if favorite.destroy
     # Flash success and redirect to @post
     flash[:error] = "Post has been successfully deleted"
     redirect_to [post.topic, post]
   else
     # Flash error and redirect to @post
     flash[:error] = "Favorite couldn't be deleted"
     redirect_to [post.topic, post]
   end
 end
end
