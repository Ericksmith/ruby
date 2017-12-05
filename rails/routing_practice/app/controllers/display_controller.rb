class DisplayController < ApplicationController
  def hello
    render text: "Hello CodingDojo!"
  end

  def say
    render text: "Saying hello!"
  end

  def times
    if session[:times] == nil
      session[:times] = 1
    else
      session[:times] += 1
    end
    render text: "This page has been visited #{session[:times]} times"
  end

  def restart
    reset_session
    render text: "Destroyed the session!"
  end

  def joe
    render text: "Saying Hello to joe"
  end

  def name
    if params[:name] === "michael"
      redirect_to "/say/hello/joe"
    else
      render text: "Saying hello #{params[:name]}!"
    end
  end

  def index
    render text: "What did you want me to say???"
  end 
end
