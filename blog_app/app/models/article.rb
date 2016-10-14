class Article < ActiveRecord::Base
    validates_presence_of(:title)
    validates_presence_of(:body)
    belongs_to :user
    
    default_scope{order(created_at: :desc)}
end
