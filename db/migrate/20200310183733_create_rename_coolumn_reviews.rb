class CreateRenameCoolumnReviews < ActiveRecord::Migration
  def change
    create_table :rename_coolumn_reviews do |t|

      t.timestamps null: false
    end
  end
end
