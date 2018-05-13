class AddNotesToInstitutions < ActiveRecord::Migration[5.2]
  def change
    add_column :institutions, :notes, :text
  end
end
