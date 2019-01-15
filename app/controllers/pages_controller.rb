class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @annonces = Annonce.where(status: 2).order(created_at: :desc).first(5)
  end
end
