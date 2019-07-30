class EchangesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @echange = Echange.new
  end

  def create
    @echange = Annonce.new(echange_params.merge(proprietaire_accept: false))
    @echange.save

    redirect_to vos_echanges_path
    flash[:notice] = "Votre échange à bien été demandé, vous devez désormais attendre la réponse de l'utilisateur. Vous pouvez consulter vos échanges dans la rubrique 'Echanges'.".html_safe
  end

  def edit
    @echange = Annonce.find(params[:id])
    if @echange.proprietaire_id != current_user
      flash[:alert] = "Vous ne pouvez pas acceéder à cette échange.".html_safe
      redirect_to vos_annonces_path
    end
  end

  def update
    @echange = Echange.find(params[:id])
    if (echange_params[:] == "")
      redirect_to edit_echange_path(@annonce)
      flash[:alert] = "Veuillez renseigner touts les champs.".html_safe
    else
      @echange.update(echange_params)
      redirect_to vos_echanges_path
      flash[:notice] = "Vous avez accepté un échange.".html_safe
    end
  end

  def all
    @echanges = Echange.all
  end

  def vos_annonces
    @echanges_demande_user =  Echange.where(demandeur_id: current_user)
    @echanges_demande_autre_user =  Echange.where(proprietaire_id: current_user)
    if @echanges_demande_user.empty? && @echanges_demande_autre_user.empty?
      flash[:alert] = "Vous n'avez aucun échange en cours ou échange que vous avez demandé.".html_safe
    end
  end

  def destroy
    @echange = Echange.find(params[:id])
    @echange.destroy
    redirect_to vos_echanges_path
    flash[:alert] = "L'échange à bien été supprimé.".html_safe
  end

  def show
    @echange = Echange.where(id: params[:annonce_id])
  end

  def infos_selected_anonce_modal
    @annonce = Annonce.where(id: params[:annonce_id])
    render :json => ActiveSupport::JSON.encode(@annonce)
  end
end
