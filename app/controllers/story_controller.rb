class StoryController < ApplicationController
  before_action :load_story, only: %i(show)
  def show
    @story = Story.find_by id: params[:id]
  end

  def index; end

  def new; end

  def selectstory
    @stories = Story.filter params[:type]
    respond_to do |format|
      format.js
    end
  end

  private

  def load_story
    @story = Story.find_by id: params[:id]
    return if @story
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end
end
