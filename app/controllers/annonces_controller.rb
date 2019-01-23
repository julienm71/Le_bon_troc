class AnnoncesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params.dig("search").present?
      @param_search_produit = params["search"]["produit"].gsub(/[^a-zA-Z 0-9]/, '').strip()
      @param_search_localisation = params["search"]["localisation"].gsub(/[^a-zA-Z ]/, '').strip()
      @param_search_where = params["search"]["where"]
      if @param_search_where == "1"
      @annonces = Annonce.where('lower(titre) LIKE ?', "%#{@param_search_produit.downcase}%").order(created_at: :desc)
      elsif @param_search_where == "2"
      @annonces = Annonce.where('lower(contre) LIKE ?', "%#{@param_search_produit.downcase}%").order(created_at: :desc)
      end
      if @annonces.empty?
        redirect_to root_path
        flash[:alert] = "Aucune annonces ne correspondes à '#{@param_search_produit}'".html_safe
      else
        if @param_search_localisation != 'France'
          @annonces_by_localisation = []
          @annonces.each do |annonce|
            if annonce.user.region == @param_search_localisation
              @annonces_by_localisation << annonce
            end
          end
          if @annonces_by_localisation.empty?
            redirect_to root_path
            flash[:alert] = "Aucune annonces ne correspondes à '#{@param_search_produit}' en #{@param_search_localisation}".html_safe
          else
            @annonces_page_title = "Annonces correspondantes à '#{@param_search_produit}' en #{@param_search_localisation}"
            @annonces_count = @annonces_by_localisation.count
          end
        else
          @annonces_page_title = "Annonces correspondantes à '#{@param_search_produit}' en France"
          @annonces_count = @annonces.count
        end
      end
    else
      @annonces = Annonce.where(status: 2).order(created_at: :desc)
      @annonces_count = @annonces.count
      @annonces_page_title = "Toutes les annonces"
    end
  end

  # def filtre_recent(current_annonces)
  #   flash[:notice] = "Ca passe recent"
  #   @annonces = current_annonces.order(created_at: :desc)
  # end

  # def filtre_vieux(current_annonces)
  #   @annonces = annonces.order(created_at: :asc)
  # end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params.merge(status: 0, user_id: current_user.id))
    @annonce.save

    redirect_to vos_annonces_path
    flash[:notice] = "Votre annonce à bien été créé. Vous pouvez la consulter dans la rubrique 'Mes annonces'.".html_safe

  end

  def edit
    @annonce = Annonce.find(params[:id])
    if @annonce.user == current_user
    else
    flash[:alert] = "Vous ne pouvez pas modifier cette annonce.".html_safe
    redirect_to vos_annonces_path
    end
  end

  def update
    @annonce = Annonce.find(params[:id])
    if (annonce_params[:titre] == "" || annonce_params[:description] == "" || annonce_params[:raison] == "" || annonce_params[:contre] == "")
      redirect_to edit_annonce_path(@annonce)
      flash[:alert] = "Veuillez renseigner touts les champs.".html_safe
    else
      @annonce.update(annonce_params.merge(status: 0, user_id: @annonce.user_id))
      redirect_to annonce_path(@annonce)
      flash[:notice] = "Votre annonce à bien été modifié, de ce faite elle sera soumise à une nouvelle vérification et sera visible sur le dans les 24 heures qui suivent.".html_safe
    end
  end

  def all
    @annonces = Annonce.all
  end

  def vos_annonces
    @status_list = ["en attente", "refusé", "accepté"]
    @annonces =  Annonce.all.order(created_at: :desc)
    @annonces_user = []
    @annonces.each do |annonce|
      if annonce.user_id == current_user.id
        @annonces_user << annonce
      end
    end
    if @annonces_user.empty?
      flash[:alert] = "Vous n'avez publié aucune annonces. Vous pouvez en publier une dans la rubrique 'Déposer une annonce'.".html_safe
    end
  end

  def destroy
    @annonce = Annonce.find(params[:id])
    @annonce.destroy
    redirect_to vos_annonces_path
    flash[:alert] = "Votre annonce à bien été supprimé.".html_safe
  end

  def show
    @typeechange_list = ["Seulement remise en main propre.", "Seulement envoie par la poste.", "Remise en main propre ou envoie par la poste."]
    @annonce = Annonce.find(params[:id])
  end

  private

  def set_annonce_instance
    @annonce = Annonce.find(params[:id])
  end

  def annonce_params
    params.require(:annonce).permit(:titre, :description, :contre, :user_id, :autrepropositions, :raison, :photo, :photo2, :photo3, :typeechange)
  end
end
