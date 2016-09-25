class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { large: "960x572", medium: "360x215>", thumb: "160x96>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
