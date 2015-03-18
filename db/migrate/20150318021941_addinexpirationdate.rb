class Addinexpirationdate < ActiveRecord::Migration
  def change
    add_column :tasks, :expires_at, :datetime
    add_column :tasks, :completed, :boolean, default: false
  end
end
