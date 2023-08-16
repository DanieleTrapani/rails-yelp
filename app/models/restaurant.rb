class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: %w[chinese italian japanese french belgian],
                                    message: '%<value>s is not a valid restaurant' }
  has_many :reviews, dependent: :destroy
end
