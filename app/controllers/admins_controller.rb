class AdminsController < ApplicationController

  before_action :set_admin, only: [:set_user_type]
  before_action do
      render :file => "public/401", :status => :unauthorized unless current_user && current_user.admin
  end

  def set_user_type
    @admin.user.user_type = 1
    respond_to do |format|
      if @admin.user.save
        format.html { redirect_to start_page_index_path, notice: 'Now viewing as an Admin.' }
      end
    end
  end

  def new
    @admin = Admin.new
    @user = User.new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      respond_to do |format|
        format.html { redirect_to users_path, notice: 'New user created' }
      end
    else
      render 'new'
    end
  end

  def show
    @admin = Admin.find(params['id'])
    @admin.user.user_type = 1
    @admin.user.save
    @admin
  end

  def index
    @admins = Admin.all
  end

  def edit
    @admin = Admin.find(params['id'])
  end

  def update
    @admin = Admin.find(params['id'])

    if @admin.update(params.require(:admin).permit(:email,:name))
      redirect_to @admin
    else
      render 'edit'
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation, :phone, :user_type)
  end

end
