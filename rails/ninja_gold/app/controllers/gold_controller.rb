class GoldController < ApplicationController
  def index
    if session[:gold] == nil
      session[:gold] = 0
      session[:log] = []
    end
  end

  def find_gold
    amount = gold_math(params[:location])
    if amount >= 0
      session[:log].push("Earned #{amount} golds from the #{params[:location]}! #{Time.now}")
      session[:gold] += amount
    else
      session[:log].push("Entered a casino and lost #{amount} golds... Ouch... #{Time.now}")
      session[:gold] -= amount
    end
    redirect_to :back
  end

  private
    def gold_math input
      locations = {
        "farm" => Random.rand(10..20),
        "cave" => Random.rand(5..10),
        "house" => Random.rand(2..5),
        "casino" => Random.rand(-50..50)
      }
      locations[input]
    end
end
