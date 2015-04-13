class Goal < ActiveRecord::Base
  belongs_to :user
  
  has_many :savings_deposits
  
  accepts_nested_attributes_for :savings_deposits,
  															reject_if: proc { |attributes| attributes['amount'].blank? },
  															allow_destroy: true
  
  validates :name, :description, :start_date, :target_amount, presence: true
  has_attached_file :image, styles: { :medium => "400x400#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
