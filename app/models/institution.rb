# == Schema Information
#
# Table name: institutions
#
#  id                   :bigint(8)        not null, primary key
#  application_deadline :date
#  essay_prompt         :text
#  location             :string
#  mascot               :string
#  name                 :string
#  notes                :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Institution < ApplicationRecord
  validates :application_deadline, presence: true, allow_blank: false, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :name, presence: true, allow_blank: false, uniqueness: { case_sensitive: false }
  validates :location, presence: true, allow_blank: false
end
