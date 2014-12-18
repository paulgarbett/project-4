class AddCommentModel < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :body
      t.references :post, index: true

      t.timestamps
  	end
  end
end