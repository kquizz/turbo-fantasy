class Event < ApplicationRecord
  validates :title, presence: true
  has_many :leagues

  scope :ordered, -> { order(id: :desc) }

  broadcasts_to ->(event) { "events" }, inserts_by: :prepend

  def days_until_text
    return if start_date.blank?

    days_until = (self.start_date - Date.today).to_i
    if days_until == 0
      "Starts Today"
    elsif days_until == 1
      "Starts Tomorrow"
    elsif days_until < 0
      "Already Started"
    else
      "Starts #{days_until} days from now"
    end
  end

  def length_text
    return if start_date.blank? || end_date.blank?

    "#{(self.end_date - self.start_date).to_i} days long"
  end
end
