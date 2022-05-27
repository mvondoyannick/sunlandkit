class AbonnementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_abonnement, only: %i[ show edit update destroy ]

  # GET /abonnements or /abonnements.json
  def index
    @abonnements = Abonnement.all
  end

  # GET /abonnements/1 or /abonnements/1.json
  def show
  end

  # GET /abonnements/new
  def new
    @abonnement = Abonnement.new
  end

  # GET /abonnements/1/edit
  def edit
  end

  # POST /abonnements or /abonnements.json
  def create
    @abonnement = Abonnement.new(abonnement_params)

    respond_to do |format|
      if @abonnement.save
        format.html { redirect_to abonnement_url(@abonnement), notice: "Abonnement was successfully created." }
        format.json { render :show, status: :created, location: @abonnement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @abonnement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /abonnements/1 or /abonnements/1.json
  def update
    respond_to do |format|
      if @abonnement.update(abonnement_params)
        format.html { redirect_to abonnement_url(@abonnement), notice: "Abonnement was successfully updated." }
        format.json { render :show, status: :ok, location: @abonnement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @abonnement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abonnements/1 or /abonnements/1.json
  def destroy
    @abonnement.destroy

    respond_to do |format|
      format.html { redirect_to abonnements_url, notice: "Abonnement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_abonnement
      @abonnement = Abonnement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def abonnement_params
      params.require(:abonnement).permit(:customer_id, :kit_id, :active)
    end
end
