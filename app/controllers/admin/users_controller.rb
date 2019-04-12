class Admin::UsersController < ApplicationController
before_action :authenticate_admin!
before_action :allow_without_password, only: [:update]

  def index
    @current_nav = "Users"
    @users = User.all.uniq
    @users_classic = User.where(admin: false).uniq
    @users_admin = User.where(admin: true).uniq
  end

  # def modal_settings
  #   current_user = User.find(params[:format])
  #   @current_modal_user = current_user

  #   @status_list = ["en attente", "refusé", "accepté"]
  #   @annonces =  Annonce.all.order(created_at: :desc)
  #   @annonces_user = []
  #   @annonces.each do |annonce|
  #     if annonce.user_id == current_user.id
  #       @annonces_user << annonce
  #     end
  #   end
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Utilisateur créé"
      redirect_to admin_users_path
    else
      render new_admin_user_path
      flash[:alert] = "Erreur lors de la création de l'utilisateur"
    end
  end

   def edit
     @user = User.find(params[:id])
   end

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
       redirect_to admin_user_path
       flash[:notice] = "Utilisateur mis à jour".html_safe
     else
       render edit_admin_user_path
       flash[:alert] = "Erreur lors de la mise à jour de l'utilisateur".html_safe
     end
   end

  def destroy
    @annonce = User.find(params[:id])
    @annonce.destroy
    redirect_to admin_user_path
    flash[:notice] = "Utilisateur supprimé".html_safe
  end

  private

  def authenticate_admin!
    if !current_user.admin
      redirect_to root_path and return
    end
  end

  def allow_without_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
    end
    if params[:user][:current_password].blank?
      params[:user].delete(:current_password)
    end
  end

  # def users_params
  #   params.permit(:format, :user)
  # end
end
