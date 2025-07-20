class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def contact
    @name = "Mai Minh Quan"
  end
end
