class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.references :publisher
      t.datetime :published_at
      t.string :isbn10
      t.string :isbn13
      t.integer :page_count
      t.timestamps
    end
    create_table :authors_books, :id => false do |t|
      t.references :author, :book
    end
    add_index(:books, :title)
    add_index(:authors_books, [ :author_id, :book_id ])

  end
end
