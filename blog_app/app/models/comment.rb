class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  
  validates_presence_of :body
  
  
  
  def self.persisted
    where.not(id: nil)
    
  end
end
