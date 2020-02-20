class CreateTaxForms < ActiveRecord::Migration[5.2]
  def change
    create_table :tax_forms do |t|
      t.integer :tax_year
      t.string :form_name

      t.timestamps
    end
    add_index :tax_forms, :tax_year
    add_index :tax_forms, :form_name
  end
end
