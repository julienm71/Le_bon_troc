class EchangesController < ApplicationController

  # def infos_modal_echange
  #   @user = User.find(params[:user_id_echange])
  #   @user_annonces = Annonce.all.where(user_id: params[:user_id_echange])
  #   render :json => ActiveSupport::JSON.encode(['user' => @user, 'user_annonces' => @user_annonces])
  # end

  def infos_selected_anonce_modal
    @annonce = Annonce.where(id: params[:annonce_id])
    render :json => ActiveSupport::JSON.encode(@annonce)
  end
end
