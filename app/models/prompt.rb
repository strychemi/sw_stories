class Prompt < ActiveRecord::Base
  belongs_to :user
  has_many :drafts
end
