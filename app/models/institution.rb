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
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Institution < ApplicationRecord
end
