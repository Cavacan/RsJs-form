class JsHomeController < ApplicationController
  def index
  end

  def get_form
    @user = User.new
    render partial: 'home/form'
  end
end
