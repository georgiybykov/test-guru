class ChangeDefaultValues < ActiveRecord::Migration[6.0]
  def change
    # change_column :categories, :title, :string, limit: 30

    reversible do |change|
      change.up do
        change_column :categories, :title, :string, limit: 30
      end

      change.down do
        change_column :categories, :title, :string, limit: 20
      end
    end

    change_column_default :tests, :title, from: nil, to: 'The title of the test'
    change_column_default :tests, :level, from: nil, to: 1
    change_column_default :tests, :presence, from: nil, to: false
    change_column_default :answers, :body, from: nil, to: 'The text of an answer'
    change_column_default :answers, :correct, from: nil, to: false
    change_column_default :questions, :body, from: nil, to: 'The text of a question'
    change_column_default :results, :score, from: nil, to: 0
    change_column_default :categories, :title, from: nil, to: 'The name of the test category'
    change_column_default :users, :name, from: nil, to: 'Username'
    change_column_default :users, :email, from: nil, to: 'email@mail.com'
    change_column_default :users, :password_digest, from: nil, to: '******'
  end
end
