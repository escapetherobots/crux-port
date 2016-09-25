class Pin < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { large: "960x572", medium: "378x378>", thumb: "184x184>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
