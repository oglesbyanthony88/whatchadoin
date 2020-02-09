class Nag < ApplicationRecord
  belongs_to :admin
  belongs_to :user
  belongs_to :nagfeed
end
