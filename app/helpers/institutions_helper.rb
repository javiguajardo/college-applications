module InstitutionsHelper
  def format_date(date)
    date.strftime('%-B %-d, %Y')
  end

  def us_cities
    Uscs.cities
  end
end
