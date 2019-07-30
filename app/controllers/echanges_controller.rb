class EchangesController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @echange = Echange.new
  end

  def create
    @echange = Echange.new(echange_params)
    if @echange.save!
      redirect_to vos_echanges_path
      flash[:notice] = "Votre échange à bien été demandé, vous devez désormais attendre la réponse de l'utilisateur. Vous pouvez consulter vos échanges dans la rubrique 'Echanges'.".html_safe
    else
      flash[:alert] = "Une erreur es survenue lors de l'enregistrement de votre demande d'échange, veuillez ré-essayer."
    end
  end

  def edit
    @echange = Echange.find(params[:id])
    if @echange.proprietaire_id != current_user
      flash[:alert] = "Vous ne pouvez pas acceéder à cette échange.".html_safe
      redirect_to vos_echanges_path
    end
  end

  def update
    @echange = Echange.find(params[:id])
    if (params[:proprietaire_accept] == "")
      redirect_to edit_echange_path(@echange)
      flash[:alert] = "Veuillez renseigner touts les champs.".html_safe
    else
      @echange.update(params)
      redirect_to vos_echanges_path
      flash[:notice] = "Vous avez accepté un échange.".html_safe
    end
  end

  def all
    @echanges = Echange.all
  end

  def vos_echanges
    @echanges_demande_user =  Echange.where(demandeur_id: current_user)
    @echanges_demande_autre_user =  Echange.where(proprietaire_id: current_user)
    @echanges_demande_user.each do |echange|
      user_echange = User.find(echange.proprietaire_id)
      user_echange_annonce = Annonce.find(echange.annonce_id)
      echange.user_echange_annonce = user_echange_annonce
      echange.user_echange = user_echange
    end
    @echanges_demande_autre_user.each do |echange|
      user_echange = User.find(echange.demandeur_id)
      user_echange_annonce = Annonce.find(echange.annonce_id)
      echange.user_echange_annonce = user_echange_annonce
      echange.user_echange = user_echange
    end
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
    @echange = Echange.where(id: params[:echange_id])
  end

  def get_annonce_infos_for_modal
    @annonce = Annonce.where(id: params[:annonce_id])
    render :json => ActiveSupport::JSON.encode(@annonce)
  end

  private
  def echange_params
    params.require(:echange).permit(
                                    :demandeur_id,
                                    :proprietaire_id,
                                    :annonce_id,
                                    :proprietaire_accept,
                                    :typeechange,
                                    :objetdemandeur_photo1,
                                    :objetdemandeur_photo2,
                                    :objetdemandeur_photo3,
                                    :objetdemandeur_titre
                                  )
  end
end
