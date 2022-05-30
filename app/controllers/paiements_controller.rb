class PaiementsController < ApplicationController
  before_action :set_paiement, only: %i[ show edit update destroy ]

  # GET /paiements or /paiements.json
  def index
    @paiements = Paiement.all
  end

  # GET /paiements/1 or /paiements/1.json
  def show
  end

  # GET /paiements/new
  def new
    @paiement = Paiement.new
  end

  # GET /paiements/1/edit
  def edit
  end

  # POST /paiements or /paiements.json
  def create
    @paiement = Paiement.new(paiement_params)

    respond_to do |format|
      if @paiement.save
        format.html { redirect_to paiement_url(@paiement), notice: "Paiement was successfully created." }
        format.json { render :show, status: :created, location: @paiement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paiements/1 or /paiements/1.json
  def update
    respond_to do |format|
      if @paiement.update(paiement_params)
        format.html { redirect_to paiement_url(@paiement), notice: "Paiement was successfully updated." }
        format.json { render :show, status: :ok, location: @paiement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paiement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paiements/1 or /paiements/1.json
  def destroy
    @paiement.destroy

    respond_to do |format|
      format.html { redirect_to paiements_url, notice: "Paiement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paiement
      @paiement = Paiement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paiement_params
      params.require(:paiement).permit(:amount, :customer_id, :abonnement_id, :token)
    end
end
