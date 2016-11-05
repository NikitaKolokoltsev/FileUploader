class UsersController < ApplicationController
  before_action :set_user

  def index
    @attachments = Attachment.all.reverse
  end

  def show
  end

  private

  def set_user
    @user = current_user
  end
end
