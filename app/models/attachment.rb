class Attachment
  include Mongoid::Document

  mount_uploader :attachment, AttachmentUploader

  belongs_to :user, inverse_of: :user

  validates_presence_of :attachment

  field :content_type
end