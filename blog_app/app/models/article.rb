class Article < ActiveRecord::Base
    validates_presence_of(:title)
    validates_presence_of(:body)
    belongs_to :user
    has_many :comments, dependent: :destroy   #If the article is destroyed, the comments will too
    
    default_scope{order(created_at: :desc)}
end
