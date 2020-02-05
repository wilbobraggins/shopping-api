class DropItems < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.remove :items
    end
  end
end
