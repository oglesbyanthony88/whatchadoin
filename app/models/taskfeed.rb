class Taskfeed < ApplicationRecord
  has_many :tasks, through: :users
  belongs_to :group
end
