class Blog < ApplicationRecord
  include Visible
  belongs_to :user
  belongs_to :website
  after_create :blog_create


end

