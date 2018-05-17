# == Schema Information
#
# Table name: student_applications
#
#  id             :bigint(8)        not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  institution_id :bigint(8)
#  student_id     :bigint(8)
#
# Indexes
#
#  index_student_applications_on_institution_id  (institution_id)
#  index_student_applications_on_student_id      (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (institution_id => institutions.id)
#  fk_rails_...  (student_id => students.id)
#

class StudentApplication < ApplicationRecord
  validates_presence_of :institution_id

  belongs_to :student
  belongs_to :institution

  delegate :name, :graduation_date, to: :student, prefix: true, allow_nil: true
  delegate :name, :application_deadline, to: :institution, prefix: true, allow_nil: true

  enum status: [:canceled, :accepted]
end
