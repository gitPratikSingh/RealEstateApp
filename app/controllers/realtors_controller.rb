class RealtorsController < ApplicationController
  before_action :set_realtor, only: [:show, :edit, :update, :destroy, :set_user_type]

  def set_user_type
    # byebug
    @realtor.user.user_type = 2
    respond_to do |format|
      if @realtor.user.save
        format.html { redirect_to root_path, notice: 'Now viewing as a Realtor.' }
      end
    end
  end

  # GET /realtors
  # GET /realtors.json
  def index
    @realtors = Realtor.all
  end

  # GET /realtors/1
  # GET /realtors/1.json
  def show
  end

  # GET /realtors/new
  def new
    @realtor = Realtor.new
  end

  # GET /realtors/1/edit
  def edit
  end

  # POST /realtors
  # POST /realtors.json
  def create
    # puts params.inspect
    # puts realtor_params.inspect

    @realtor = Realtor.new(realtor_params)

    if (current_user.user_type != 1 and params['create_by_admin'] == 0) || realtor_params[:user_id] == nil #We do not want admins to automatically bind created users to account.
      @realtor.user = current_user
    else
      @realtor.user = User.find(realtor_params[:user_id])
    end

    @realtorExists = Realtor.where('user_id': @realtor.user.id)

    # puts @realtor.user.inspect

    if @realtorExists.empty?

      respond_to do |format|
        if @realtor.save
          format.html { redirect_to @realtor, notice: 'Realtor was successfully created.' }
          format.json { render :show, status: :created, location: @realtor }

          @realtor.user.user_type = 2 # set user type to realtor after creation
          @realtor.user.save          # save realtor to current user
        else
          format.html { render :new }
          format.json { render json: @realtor.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_realtor_path, notice: 'Realtor account already exists for this user.' }
        format.json { head :no_content }
      end
    end

  end

  # PATCH/PUT /realtors/1
  # PATCH/PUT /realtors/1.json
  def update

    respond_to do |format|
      if @realtor.update(realtor_params)
        format.html { redirect_to @realtor, notice: 'Realtor was successfully updated.' }
        format.json { render :show, status: :ok, location: @realtor }
      else
        format.html { render :edit }
        format.json { render json: @realtor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /realtors/1
  # DELETE /realtors/1.json
  def destroy
    @realtor.destroy
    respond_to do |format|
      format.html { redirect_to realtors_url, notice: 'Realtor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_realtor
      @realtor = Realtor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def realtor_params
      params.require(:realtor).permit(:full_name, :phone, :user, :real_estate_company_id, :user_id)
    end
end
