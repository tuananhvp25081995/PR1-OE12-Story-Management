class CommentsController < ApplicationController
  before_action :load_comment, only: %i(edit update destroy)
  before_action :correct_member, only: %i(destroy)

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_member.comments.build comment_params
    if @comment.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @comment.story
  end

  def edit;end

  def update
    if @comment.update comment_params
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @comment.story
  end

  def destroy
    if @comment.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to @comment.story
  end

  private

  def comment_params
    params.require(:comment).permit :content, :story_id, :member_id
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end

  def correct_member
    redirect_to root_url unless current_member? @comment.member
  end
end
