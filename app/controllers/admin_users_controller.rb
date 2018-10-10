class AdminUsersController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_admin_user!

  def index; end
end
