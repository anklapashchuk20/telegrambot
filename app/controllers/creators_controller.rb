class CreatorsController < ApplicationController
  def index
    @creators = Creator.all
  end

  def show
    @creator = Creator.find(params[:id])
  end


def destroy
    @creator = Creator.find(params[:id])
    @creator.destroy

    redirect_to root_path
  end

  
end


