class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string    :title
      t.decimal   :price, precision: 8, scope: 2
    end
  end
end
