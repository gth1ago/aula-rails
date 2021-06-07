class CreateTarefas < ActiveRecord::Migration[6.1]
  def change
    create_table :tarefas do |t|
      t.string :name
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
