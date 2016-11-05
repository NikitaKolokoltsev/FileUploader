class AttachmentsController < ApplicationController

	def create
		@user = User.find(params[:user_id])
		@attachment = @user.attachments.create!(file_params.merge(user: @user))
		redirect_to root_path
	end

	private

	def file_params
		params.require(:attachment).permit(:attachment)
	end
end