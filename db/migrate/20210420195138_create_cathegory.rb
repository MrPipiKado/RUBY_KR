class CreateCathegory < ActiveRecord::Migration[6.0]
  def change
    create_table :cathegories do |t|
      t.string :name
    end
  end
end
