class Admin::DashboardController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Dashboard"

    @nb_users_total = User.all.count
    @nb_users_utilisateurs = User.where(admin: false).count
    @nb_users_administrateurs = User.where(admin: true).count

    @nb_annonces_total = Annonce.all.order(created_at: :desc).uniq.count
    @nb_annonces_en_attente =  Annonce.where(status: 0).order(created_at: :desc).uniq.count
    @nb_annonces_accepte =  Annonce.where(status: 2).order(created_at: :desc).uniq.count
    @nb_annonces_refuse =  Annonce.where(status: 1).order(created_at: :desc).uniq.count

    @nb_echanges_total = Echange.all.count
    @nb_echanges_en_attente = Echange.where(status: 'echange_en_attente').count
    @nb_echanges_en_cours = Echange.where(status: 'echange_en_cours').count
    @nb_echanges_finit = Echange.where(status: 'echange_finit').count
    @nb_echanges_annuler = Echange.where(status: 'echange_annuler').count
    @nb_echanges_refuser = Echange.where(status: 'echange_refuser').count
    @nb_echanges_en_conflit = Echange.where(conflit: true, status: 'echange_en_conflit').count
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end
end
