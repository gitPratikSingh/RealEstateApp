class InquiriesController < ApplicationController
  before_action :set_inquiry, only: [:show, :edit, :update, :destroy]

  def reply

  end

  # GET /inquiries
  # GET /inquiries.json
  def index
    if current_user.user_type = 3
      @inquiries = Inquiry.where("house_hunter_id = ?", params[:house_hunter_id])
    elsif current_user.user_type = 2
      @inquiries = Inquiry.where("house_id = ?", params[:house_id])
    elsif current_user.user_type =1
      @inquiries = Inquiry.all
    end
  end

  # GET /inquiries/1
  # GET /inquiries/1.json
  def show
  end

  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new
  end

  # GET /inquiries/1/edit
  def edit
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.house_hunter = current_user.house_hunter
    @house = House.find(inquiry_params[:house_id])
    respond_to do |format|
      if @inquiry.save
        current_user.house_hunter.inquiries << @inquiry
        current_user.house_hunter.save
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully created.' }
        format.json { render :show, status: :created, location: @inquiry }
      else
        format.html { render :new }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquiries/1
  # PATCH/PUT /inquiries/1.json
  def update
    respond_to do |format|
      if @inquiry.update(inquiry_params)
        format.html { redirect_to @inquiry, notice: 'Inquiry was successfully updated.' }
        format.json { render :show, status: :ok, location: @inquiry }
      else
        format.html { render :edit }
        format.json { render json: @inquiry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to inquiries_path(house_hunter_id: @inquiry.house_hunter_id, house_id: @inquiry.house_id), notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:subject, :message, :house_id)
    end
end
