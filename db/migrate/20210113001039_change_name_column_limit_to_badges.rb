class ChangeNameColumnLimitToBadges < ActiveRecord::Migration[6.0]
  def up
    change_column :badges, :name, :string, limit: 50
  end

  def down
    change_column :badges, :name, :string, limit: 20
  end
end
