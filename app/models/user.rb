class User < ApplicationRecord
  has_many :nags
  has_many :tasks
end
