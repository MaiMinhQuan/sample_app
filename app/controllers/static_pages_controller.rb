class StaticPagesController < ApplicationController
  def home; end

  def help; end

  def contact
    @name = Settings.name
  end
end
