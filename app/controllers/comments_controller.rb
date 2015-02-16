class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @photo = Photo.find_by(id: (params[:id]))
    @comment = current_user.comments.build if logged_in?
  end

  def create
    photo = Photo.find_by(id: params[:id])
    @comment = current_user.comments.build(comment_params)
    if @comment
      @comment.photo_id = photo.id
    end

    if @comment.save
      flash[:success] = "Comment added!"
      redirect_to current_user
    else
      flash[:danger] = "Invalid comment"
      redirect_to new_comment_path(id: photo)
    end
  end

  def destroy
    if @comment
      @comment.destroy
      flash[:success] = "Comment deleted"
    else
      flash[:danger] = "Not allowed to delete"
    end
    redirect_to current_user

  end

  private

    def comment_params
      params.require(:comment).permit(:comment)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
    end
end
