class ApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def new
    binding.pry
    @application = Application.new(params[:application_id])
  end
end
