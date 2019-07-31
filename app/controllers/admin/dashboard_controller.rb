class Admin::DashboardController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Dashboard"
    @nb_users = User.all.count
    @nb_annonces = Annonce.all.count
    @nb_echanges = Echange.all.count
    @nb_conflits = Echange.where(conflit: true, status: 'en_conflit', status_conflit: 'en_attente_de_traitement_admin_conflit').count
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end
end
