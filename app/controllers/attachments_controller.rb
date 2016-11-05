class AttachmentsController < ApplicationController
	def index
		@attachments = Attachment.all
		redirect_to root_path
	end

	def create
		@user = User.find(params[:user_id])
		attachment = @user.attachments.new(file_params)
		if attachment.save
			redirect_to root_path
		else
			@attachments = Attachment.all
			@errors = attachment.errors.full_messages.map { |e| e.gsub!("Attachment", "File") }
			render "users/index"
		end
	end

	private

	def file_params
		params.require(:attachment).permit(:attachment)
	end
end