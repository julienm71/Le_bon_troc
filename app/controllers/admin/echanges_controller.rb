class Admin::EchangesController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Echanges"
    @echanges_en_attente = Echange.where(status: 'echange_en_attente')
    @echanges_en_attente.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end

    @echanges_en_cours = Echange.where(status: 'echange_en_cours')
    @echanges_en_cours.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end

    @echanges_refuser = Echange.where(conflit: false, status: 'echange_refuser')
    @echanges_refuser.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end

    @echanges_annuler = Echange.where(status: 'echange_annuler')
    @echanges_annuler.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end

    @echanges_finit = Echange.where(status: 'echange_finit')
    @echanges_finit.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end

    @echanges_en_conflit = Echange.where(conflit: true, status: 'echange_en_conflit')
    @echanges_en_conflit.each do |echange|
      user_demandeur = User.find(echange.demandeur_id)
      user_proprietaire = User.find(echange.proprietaire_id)
      annonce_echange = Annonce.find(echange.annonce_id)

      echange.user_demandeur = user_demandeur
      echange.user_proprietaire = user_proprietaire
      echange.annonce = annonce_echange
    end
  end

  def update
    @echange = Echange.find(params[:id])
    user_echange = User.find(@echange.demandeur_id)
    @echange.update!(update_params)
    redirect_to vos_echanges_path
    # if params[:status].present?
    #   if params[:status] == 'echange_en_cours'
    #   params[:status] == 'echange_en_cours' ? status_s = 'accepté' : status_s = 'refusé'
    #   status_s == 'accepté' ? notice_s = :notice : notice_s = :alert
    #   flash[notice_s] = "Vous avez #{status_s} l'échange de #{user_echange.pseudo}.".html_safe
    #   elsif params[:status] == 'echange_annuler'
    #     flash[:notice] = "Vous avez annulé l'échange avec #{user_echange.pseudo}.".html_safe
    #   end
    # elsif params[:status_propietaire].present? || params[:status_demandeur].present?
    #   flash[:notice] = "Vous avez confirmé avoir reçu l'objet de #{user_echange.pseudo}, vous devez attendre qu'il confirme la récéption de votre objet.".html_safe
    # end
  end

  def destroy
    @echange = Echange.find(params[:id])
    @echange.destroy
    redirect_to vos_echanges_path
    flash[:alert] = "L'échange à bien été supprimé.".html_safe
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end
end
