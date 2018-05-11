class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :mascot
      t.date :application_deadline
      t.text :essay_prompt
      t.string :location

      t.timestamps
    end
  end
end
