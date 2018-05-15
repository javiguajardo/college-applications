# == Schema Information
#
# Table name: students
#
#  id              :bigint(8)        not null, primary key
#  date_of_birth   :date
#  email           :string
#  graduation_date :date
#  name            :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Student < ApplicationRecord
  validates_presence_of :name, :email, :graduation_date
  validates :date_of_birth, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :graduation_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :phone_number, format: {with: /\A\([0-9]{3}\)\s[0-9]{3}\s-\s[0-9]{4}\z/}
end
