class RenameBadgeImageToLogo < ActiveRecord::Migration[6.0]
  def change
    rename_column :badges, :image, :logo
  end
end
