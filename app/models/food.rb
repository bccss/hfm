class Food < ActiveRecord::Base

  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  
  has_attached_file :image, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true
  # TODO: Javascript verification of valid price format
  validates :price, presence: true
  validates :seller_id, presence: true
  validates :seller_location, presence: true

  scope :for_sale, -> { where(for_sale: true) }
  scope :sold, -> { where(for_sale: false) }

end
