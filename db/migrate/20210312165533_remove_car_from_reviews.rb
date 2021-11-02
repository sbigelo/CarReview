class RemoveCarFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_reference :reviews, :car, null: false, foreign_key: true
  end
end
