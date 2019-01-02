class Admin::StoriesController < Admin::ApplicationController
  before_action :logged_in_admin
  before_action :load_story, except: %i(index new create)

  def show
  end

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_member.stories.build story_params
    if @story.save
      flash[:success] = t ".post"
      redirect_to admin_stories_path
    else
      render :new
    end
  end

  def update
    if @story.update story_params
      flash[:success] = t ".story_update"
      redirect_to admin_stories_path
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    if @story.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to admin_stories_path
  end

  private

  def story_params
    params.require(:story).permit :name, :namestory, :describe, :image,
      :author_id
  end

  def load_story
    @story = Story.find_by id: params[:id]
    return if @story
    redirect_to admin_stories_path
    flash[:danger] = t ".notfound"
  end
end
