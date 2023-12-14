class Contestant < ApplicationRecord
  validates :name, presence: true
  
  scope :ordered, -> { order(id: :desc) }

  def age
    return unless birth_date.present?

    return ((Date.today - birth_date).to_i / 365).floor
  end
end
