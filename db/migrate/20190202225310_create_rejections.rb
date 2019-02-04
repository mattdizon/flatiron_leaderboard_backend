class CreateRejections < ActiveRecord::Migration[5.2]
  def change
    create_table :rejections do |t|
      t.references :user, foreign_key: true
      t.string :company
      t.string :stage_of_rejection
      t.string :rejection_url
      t.timestamps
    end
  end
end
