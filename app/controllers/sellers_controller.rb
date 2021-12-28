class SellersController < ApplicationController
  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end

def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    redirect_to root_path
  end

 
end

