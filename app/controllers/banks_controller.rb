class BanksController < ApplicationController

  def index
    @bank = Bank.find_by_routing_number(params[:routing_number])
    if @bank
      render :index
    else
      flash.now[:errors] = ["Bank not found"] if params[:routing_number]
      render :index
    end
  end

  def show
    bank = Bank.find_by_routing_number(params[:id])
    render json: bank.output_json
  end

end
