class Admin::MembersController < Admin::ApplicationController
  before_action :load_member, only: %i(edit update destroy)
  before_action :admin_user, only: %i(destroy)

  def index
    @members = Member.all
  end

  def show
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new member_params
    if @member.save
      log_in @member
      flash[:success] = t ".welcome"
      redirect_to admin_members_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @member.update member_params
      flash[:success] = t ".profile_update"
      redirect_to admin_members_path
    else
      render :edit
    end
  end

  def destroy
     Member.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to admin_members_path
  end


  private

  def member_params
    params.require(:member).permit :name, :email, :admin, :password, :password_confirmation
  end

  def load_member
    @member = Member.find_by id: params[:id]
    return if @member
    redirect_to admin_members_path
    flash[:danger] = t ".notfound"
  end

  def admin_user
      redirect_to(root_url) unless current_member.admin?
    end
end
