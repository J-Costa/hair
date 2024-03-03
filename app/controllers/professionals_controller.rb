class ProfessionalsController < ApplicationController
  def index
    @professionals = Professional.all
  end
end
