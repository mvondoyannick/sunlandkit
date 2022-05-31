class ApiController < ApplicationController
  def verify_kit
    if params[:code_barre].present?
      @code_barre = params[:code_barre]
      request = Kit.find_by_code_barre(@code_barre)
      if request
        @kit = Kit.find_by_code_barre(@code_barre)
        @abonnement = Abonnement.find_by_kit_id(@kit.id)
        if @abonnement
          # on retourne les informations sur le compte et le client
          render json: {
            abonnement: {
              customer_name: @abonnement.customer.name,
              customer_second_name: @abonnement.customer.second_name,
              kit: @abonnement.kit.name,
              status: @abonnement.active,
              creation: @abonnement.created_at
            },
            customer: {
              name: @abonnement.customer.name.upcase,
              second_name: @abonnement.customer.second_name,
              phone: @abonnement.customer.phone1
            },
            kit: {
              name: @abonnement.kit.name,
              code_barre: @abonnement.kit.code_barre,
              cout: @abonnement.kit.amount,
              # barre_code: "#{Rails.application.routes.url_helpers.rails_blob_path(@abonnement.kit.code_barre, only_path: true)}",
              # qrcode: "#{request.base_url}#{Rails.application.routes.url_helpers.rails_blob_path(@abonnement.kit.code_barre, only_path: true)}"
            },
            histories: @abonnement.paiements.all.map do |paiement|
              {
                abonnement: paiement.id,
                amount: paiement.amount,
                transaction_id: paiement.token,
                transaction_date: created_at,
                payment_mode: "PAYMEQUICK"
              }
            end
          }, status: :ok
        else
        
        render json: {
        	message: ""
        	}, status: :unauthorized

        end

      else
      
      render json: {
        	message: ""
        	}, status: :unauthorized

      end
    else
      render json: {
        message: "",
        errors: {

        }
      }, status: :unauthorized
    end
  end
end
