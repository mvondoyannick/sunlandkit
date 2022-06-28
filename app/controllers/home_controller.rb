class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @paiements = Paiement.all.order(created_at: :desc)
  end

  # list all users accounts
  def users
    @users = User.all
  end

  # liste des paiements
  def abonnement_paiements
    @paiements = Paiement.where(abonnement_id: params[:abonnement_id])
  end

  # add new user
  def add_new_user
    if request.post?
      #make a post request for saving new user account
    elsif request.get?
      # make a get request for liste user form
    else

    end
  end

  def make_virement
  end
end
