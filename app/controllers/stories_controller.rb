class StoriesController < ApplicationController
  before_action :load_story, only: %i(show)

  def show
    @comments = @story.comments.by_order
  end

  def index
    @stories = Story.page(params[:page]).
      per Settings.paginate.per_page
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new story_params
    if @story.save
      flash[:success] = t ".post"
      redirect_to @story
    else
      render :new
    end
  end

  private

  def story_params
    params.require(:story).permit :name, :describe, :image,
      :author_id, :member_id
  end

  def load_story
    @story = Story.find_by id: params[:id]
    return if @story
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end
end
