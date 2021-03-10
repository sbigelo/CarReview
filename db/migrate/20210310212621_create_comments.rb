class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.resources :user
      t.resources :review

      t.timestamps
    end
  end
end
