class AuthorsController < ApplicationController
  before_action :load_author, only: %i(show destroy)
  before_action :logged_in_member, :admin_member, only: %i(create destroy)

  def show; end

  def new
    @author = Author.new
  end

  def index
    @authors = Author.page(params[:page])
      .per Settings.paginate.per_page
  end

  def create
    @author = current_member.authors.build author_params
    if @author.save
      flash[:success] = t ".add"
      redirect_to @author
    else
      flash[:danger] = t ".failed"
      render :new
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failed"
    end
    redirect_to authors_path
  end

  private

  def author_params
    params.require(:author).permit :name
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    redirect_to root_url
    flash[:danger] = t ".notfound"
  end

  def admin_member
    redirect_to(root_url) unless current_member.admin?
  end
end
