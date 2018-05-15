module StudentsHelper
  def institutions_for_select
    Institution.all.order(:name).map {|institution| [institution.name, institution.id] }
  end
end
