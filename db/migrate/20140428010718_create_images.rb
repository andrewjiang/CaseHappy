class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :payload
      t.timestamps
    end
  end
end
