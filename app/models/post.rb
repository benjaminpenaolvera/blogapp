class Post < ActiveRecord::Base
  mount_uploader :header, HeaderUploader

  extend FriendlyId
  friendly_id :title, use: :slugged
end
