module InstitutionsHelper
  def format_date(date)
    date.strftime('%-B %-d, %Y')
  end

  def us_state_to_cities
    Uscs.state_to_cities
  end
end
