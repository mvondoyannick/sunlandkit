class KitsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_kit, only: %i[ show edit update destroy ]

  # GET /kits or /kits.json
  def index
    @kits = Kit.all
  end

  # GET /kits/1 or /kits/1.json
  def show
  end

  # GET /kits/new
  def new
    @kit = Kit.new
  end

  # GET /kits/1/edit
  def edit
  end

  # POST /kits or /kits.json
  def create
    @kit = Kit.new(kit_params)

    respond_to do |format|
      if @kit.save
        format.html { redirect_to kit_url(@kit), notice: "Kit was successfully created." }
        format.json { render :show, status: :created, location: @kit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kits/1 or /kits/1.json
  def update
    respond_to do |format|
      if @kit.update(kit_params)
        format.html { redirect_to kit_url(@kit), notice: "Kit was successfully updated." }
        format.json { render :show, status: :ok, location: @kit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kits/1 or /kits/1.json
  def destroy
    @kit.destroy

    respond_to do |format|
      format.html { redirect_to kits_url, notice: "Kit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kit
      @kit = Kit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kit_params
      params.require(:kit).permit(:name, :code_barre, :amount, :puissance, :poids, :couleur)
    end
end
