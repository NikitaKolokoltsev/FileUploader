class AttachmentsController < ApplicationController
  include CarrierWave::Uploader::Download
  def index
    @attachments = Attachment.all
    redirect_to root_path
  end

  def create
    @user = User.find(params[:user_id])
    attachment = @user.attachments.new(attachment_params)
    content_type = attachment.attachment.content_type
    filename = attachment.attachment.filename
    if attachment.save
      attachment.update!(content_type: content_type, filename: filename)
      redirect_to root_path
    else
      @attachments = Attachment.all
      @errors = attachment.errors.full_messages
      render "users/index"
    end
  end

  def download
    attachment = Attachment.find(params[:attachment_id])
    file = open(attachment.attachment.url).read
    send_data file, filename: File.basename(attachment.attachment.path), type: attachment.content_type
  end

  private

  def attachment_params
    params.require(:attachment).permit(:attachment)
  end
end