class TimesController < ApplicationController
  def main
    @time = Time.new.ctime
  end
end
