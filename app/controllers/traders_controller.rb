class TradersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @trader = Trader.new
  end

  def create
    # set_trader
    @trader = Trader.new(trader_params)
    if @trader.save
      redirect_to root_path, notice: "Congratulations! You've just subscribed to signals"
      # SendpulseJob.perform_now
    else
      redirect_to root_path, notice: "Something went wrong. Please enter your email again"
    end
  end

  private

  def set_trader
    @trader = Trader.find(params[:id])
  end

  def trader_params
    params.require(:trader).permit(:email)
  end
end
