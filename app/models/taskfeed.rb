class Taskfeed < ApplicationRecord
  has_many :tasks, through: :admin
  belongs_to :group
end
