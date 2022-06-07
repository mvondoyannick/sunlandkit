class ApiController < ApplicationController
  # request authorization
  def request_authorization
  end

  # save payment to API
  def save_api_paiement
  end

  # search abonnement via customer phone
  def search_customer
    if params[:phone].present?
      if Customer.exists?(phone1: params[:phone])
        @customer = Customer.find_by_phone1(params[:phone])  

        # search abonnement existence
        if @customer.abonnement.nil?
          render json: {
            message: "Ce numéro ne dispose d'aucun abonnement à un kit sunland Energy"
          }, status: :unauthorized
        else
          render json: {
            customer: {
              name: @customer.name.upcase,
              second_name: @customer.second_name,
              phone: @customer.phone1
            },
            abonnement: {
              token: @customer.abonnement.token,
              active: @customer.abonnement.active,
              creation: ApplicationHelper.format_date(@customer.abonnement.created_at)
            },
            kit: {
              name: @customer.abonnement.kit.name,
              code_barre: @customer.abonnement.kit.code_barre,
              montant: ApplicationHelper.format_money(@customer.abonnement.kit.amount),
              puissance: @customer.abonnement.kit.puissance,
              couleur: @customer.abonnement.kit.couleur,
              poids: @customer.abonnement.kit.poids
            },
            histories: @customer.abonnement.paiements.each do |paiement| 
              {
                paiement_id: paiement.id,
                montant: ApplicationHelper.format_money(paiement.amount),
                token: paiement.token,
                create: ApplicationHelper.format_date(paiement.created_at)
              } 
            end,
            montant_paid: ApplicationHelper.format_money(@customer.abonnement.paiements.sum(:amount)),
            montant_rest: ApplicationHelper.format_money(@customer.abonnement.kit.amount.to_f - @customer.abonnement.paiements.sum(:amount).to_f)
          }
        end
      else
        render json: {
          message: "Utilisateur ou compte inexistant, merci de revoir vos informations"
        }, status: :unauthorized
      end
    else
      render json: {
        message: "Some parameters are mission",
        errors: {
          code: 40004,
          description: "Unabled to found this customer"
        }
      }, status: :unauthorized
    end
  end

  # check en verify kit
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
