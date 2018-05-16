module ApplicationsHelper
  def student_name(student_id)
    Student.find_by_id(student_id).name
  end

  def student_graduation_date(student_id)
    Student.find_by_id(student_id).graduation_date
  end

  def days_until_graduation(graduation_date)
    return "#{(graduation_date - Date.current).to_i} days until graduation: #{format_date(graduation_date)}" if Date.current < graduation_date
    t('applications.index.graduation_passed', date: format_date(graduation_date))
  end
end
