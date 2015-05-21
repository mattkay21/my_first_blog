class Article < ActiveRecord::Base
  belongs_to :admin_user
  has_many :comments, dependent: :destroy

  before_validation :add_permalink
  #validations
  validates :title, :presence => true,
  					:length => {:maximum => 80}
  validates :subhead, :length => {:maximum => 140}
  validates :permalink, :presence => true


  #scopes
  scope :sorted, lambda {order("articles.created_at DESC")}

  private 

  def add_permalink
  	if permalink.blank?
  		self.permalink = "#{id}-#{title.parameterize}"
  	end
  end
end
 

