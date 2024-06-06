class Airport < ApplicationRecord
  validates :airport_code, presence: true, length: { is: 3 }, format: { with: /\A[A-Z]+\z/, message: 'only allows uppercase letters'}
end
