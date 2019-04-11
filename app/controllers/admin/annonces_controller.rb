class Admin::AnnoncesController < ApplicationController
before_action :authenticate_admin!

  def index
    @current_nav = "Annonces"
    @status_list = ["en attente", "refusé", "accepté"]
    @annonces = Annonce.all.order(created_at: :desc).uniq
    @annonces_en_attente =  Annonce.where(status: 0).order(created_at: :desc).uniq
    @annonces_accepte =  Annonce.where(status: 2).order(created_at: :desc).uniq
    @annonces_refuse =  Annonce.where(status: 1).order(created_at: :desc).uniq
  end

  def update
    @annonce = Annonce.find(params[:id])
    @annonce_current_status = @annonce.status
    @annonce.update(annonce_params)
    redirect_to admin_annonces_path
  end

  def edit
    @annonce = Annonce.find(params[:id])
  end

  def destroy
    @annonce = Annonce.find(params[:id])
    @annonce.destroy
    redirect_to admin_annonces_path
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end

  def annonce_params
    params.permit(:status)
  end
end
