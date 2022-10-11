class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :website
  after_create :blog_create

  private
    def blog_create
      puts "I have created blog!"
    end

end

