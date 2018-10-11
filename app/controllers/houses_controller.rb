class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]

  # GET /houses
  # GET /houses.json
  def index
    @houses = House.where(nil)
    puts params.inspect
    @houses = House.where(list_price: params[:list_price_low]..params[:list_price_high]) if
        params[:list_price_low].present? and params[:list_price_high].present?
    @houses = House.where(square_footage: params[:square_footage_low]..params[:square_footage_high]) if
        params[:square_footage_low].present? and params[:square_footage_high].present?
    @houses = House.where("location like ?", "#{params[:location]}%") if params[:location].present?
    @houses = House.where(year_built: params[:year_built_low]..params[:year_built_high]) if
        params[:year_built_low].present? and params[:year_built_high].present?
    @houses = House.where(num_of_floors: params[:num_of_floors_low]..params[:num_of_floors_high]) if
        params[:num_of_floors_low].present? and params[:num_of_floors_high].present?
  end

  def search

  end

  # GET /houses/1
  # GET /houses/1.json
  def show
  end

  # GET /houses/new
  def new
    # binding.pry
    @house = House.new
  end

  # GET /houses/1/edit
  def edit
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(house_params)
    @house.realtor = Realtor.find(house_params[:realtor_id])
    if house_params[:realtor_contact] == nil
      @house.realtor_contact = @house.realtor.user.phone
    end
    if house_params[:real_estate_company_id] == nil
      @house.real_estate_company = @house.realtor.real_estate_company
    end
    @house.potential_buyers_list = PotentialBuyersList.new(@house.id)
    @house.potential_buyers_list.save
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'House was successfully created.' }
        puts @house.inspect
        puts @house.potential_buyers_list.inspect
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /houses/1
  # PATCH/PUT /houses/1.json
  def update
    if current_user.user_type == 1 || (current_user.user_type == 2 && current_user.realtor.id == @house.realtor_id) || (current_user.realtor && current_user.realtor.real_estate_company_id && current_user.realtor.real_estate_company_id == @house.real_estate_company_id)
      respond_to do |format|
        if @house.update(house_params)
          format.html { redirect_to @house, notice: 'House was successfully updated.' }
          format.json { render :show, status: :ok, location: @house }
        else
          format.html { render :edit }
          format.json { render json: @house.errors, status: :unprocessable_entity }
        end
      end
    else
      # notify user they can't update this house
      respond_to do |format|
        format.html { redirect_to edit_house_path(@house), notice: 'You cannot update this house.' }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house.destroy
    respond_to do |format|
      format.html { redirect_to houses_url, notice: 'House was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house
      @house = House.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def house_params
      params.require(:house).permit(:location, :square_footage, :year_built, :style, :list_price,
      :num_of_floors, :basement, :current_owner, :realtor_contact, :real_estate_company_id, :list_price_low,
                                    :list_price_high, :realtor_id, images: [])
    end
end
