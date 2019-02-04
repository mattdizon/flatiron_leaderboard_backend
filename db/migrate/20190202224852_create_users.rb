class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
        t.string :f_name
        t.string :l_name
        t.string :username
        t.string :email
        t.string :cohort_name
        t.string :password_digest
        t.string :avatar


      t.timestamps
    end
  end
end
