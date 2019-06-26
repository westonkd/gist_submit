class AddLineItemUrlToScore < ActiveRecord::Migration[5.2]
  def change
    add_column :scores, :line_item_url, :string
    add_column :scores, :url, :string
  end
end
