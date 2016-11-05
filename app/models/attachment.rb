class Attachment
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :user, inverse_of: :user

  has_mongoid_attached_file :attachment
  do_not_validate_attachment_file_type :attachment
end