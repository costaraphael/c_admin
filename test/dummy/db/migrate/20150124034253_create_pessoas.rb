class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome
      t.integer :idade
      t.text :biografia
      t.date :nascimento

      t.timestamps null: false
    end
  end
end
