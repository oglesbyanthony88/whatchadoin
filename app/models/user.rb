class User < ApplicationRecord
  has_many :nags
  has_many :tasks
  belongs_to :group
end
