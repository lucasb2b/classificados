class AdsController < ApplicationController
  def new
    @ad = Ad.new
  end
end