class AttachmentsController < ApplicationController
	def index
		@attachments = Attachment.all
		redirect_to root_path
	end

	def create
		@user = User.find(params[:user_id])
		attachment = @user.attachments.new(attachment_params)
		puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAA"
		puts attachment
		if attachment.save
			redirect_to root_path
		else
			@attachments = Attachment.all
			@errors = attachment.errors.full_messages
			render "users/index"
		end
	end

	def download
		attachment = Attachment.find(params[:attachment_id])
		send_file attachment.attachment.url, filename: attachment.attachment.filename, type: attachment.attachment.content_type
	end

	private

	def attachment_params
		params.require(:attachment).permit(:attachment)
	end
end