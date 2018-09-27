class HouseHuntersController < ApplicationController
  before_action :set_house_hunter, only: [:show, :edit, :update, :destroy, :set_user_type]

  def set_user_type
    @house_hunter.user.user_type = 3
    respond_to do |format|
      if @house_hunter.user.save
        format.html { redirect_to start_page_index_path, notice: 'Now viewing as a House Hunter.' }
      end
    end
  end

  # GET /house_hunters
  # GET /house_hunters.json
  def index
    @house_hunters = HouseHunter.all
  end

  # GET /house_hunters/1
  # GET /house_hunters/1.json
  def show

  end

  # GET /house_hunters/new
  def new
    @house_hunter = HouseHunter.new
  end

  # GET /house_hunters/1/edit
  def edit
  end

  # POST /house_hunters
  # POST /house_hunters.json
  def create
    @house_hunter = HouseHunter.new(house_hunter_params)
    if current_user.user_type != 1
      @house_hunter.user = current_user
    else
      @house_hunter.user = User.find(house_hunter_params[:user_id])
    end
    respond_to do |format|
      if @house_hunter.save
        format.html { redirect_to @house_hunter, notice: 'House hunter was successfully created.' }
        format.json { render :show, status: :created, location: @house_hunter }
      else
        format.html { render :new }
        format.json { render json: @house_hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /house_hunters/1
  # PATCH/PUT /house_hunters/1.json
  def update
    respond_to do |format|
      if @house_hunter.update(house_hunter_params)
        format.html { redirect_to root_path, notice: 'House hunter was successfully updated.' }
        format.json { render :show, status: :ok, location: @house_hunter }
      else
        format.html { render :edit }
        format.json { render json: @house_hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /house_hunters/1
  # DELETE /house_hunters/1.json
  def destroy
    @house_hunter.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'House hunter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_hunter
      @house_hunter = HouseHunter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_hunter_params
      params.require(:house_hunter).permit(:name, :phone, :preferred_contact, :user_id)
    end
end
