class Api < ApplicationController
  def verify_kit
    if params[:code_barre].present?
      @code_barre = params[:code_barre]
      request = Kit.find_by_code_barre(@code_barre)
      if request
        # on retourne les informations sur le compte et le client
        render json: {
          message: ""
        }, status: :ok
      else

      end
    else
      render json: {
        message: "",
        errors: {

        }
      }, status: :ok
    end
  end
end