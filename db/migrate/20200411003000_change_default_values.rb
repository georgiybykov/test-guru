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

    change_column_default :tests, :level, from: nil, to: 1
    change_column_default :tests, :presence, from: nil, to: false
    change_column_default :answers, :correct, from: nil, to: false
  end
end
