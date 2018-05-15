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
  validates_presence_of :name, :email, :date_of_birth, :graduation_date
  validates :date_of_birth, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :graduation_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  validates :email, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  validates :phone_number, format: {with: /\A\([0-9]{3}\)\s[0-9]{3}\s-\s[0-9]{4}\z/}
  validates_uniqueness_of :email, :phone_number, case_sensitive: false
  validate :graduation_date_after_date_of_birth?

  private

  def graduation_date_after_date_of_birth?
    return nil unless graduation_date && date_of_birth

    if graduation_date < date_of_birth
      errors.add :graduation_date, 'must be after date of birth'
    end
  end
end
