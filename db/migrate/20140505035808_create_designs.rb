class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.attachment :renders
      t.timestamps
    end
  end
end
