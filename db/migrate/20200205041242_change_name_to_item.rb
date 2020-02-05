class ChangeNameToItem < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.rename :name, :item
    end
  end
end
