class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :creator_name
      t.string :del_passwd

      t.timestamps
    end
  end
end
