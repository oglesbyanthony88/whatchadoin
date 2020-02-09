class Task < ApplicationRecord
  belongs_to :admin
  belongs_to :user
  belongs_to :taskfeed
end
