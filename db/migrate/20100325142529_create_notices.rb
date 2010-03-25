class CreateNotices < ActiveRecord::Migration
  def self.up
    create_table :notices do |t|
      t.intiger :id
      t.string :title
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :notices
  end
end
