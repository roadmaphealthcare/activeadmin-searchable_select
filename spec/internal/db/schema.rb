ActiveRecord::Schema.define do
  create_table(:active_admin_comments, force: true) do |t|
    t.string :namespace
    t.text   :body
    t.string :resource_id,   null: false
    t.string :resource_type, null: false
    t.references :author, polymorphic: true
    t.timestamps null: false
  end

  create_table(:categories, force: true) do |t|
    t.string :name
    t.belongs_to :created_by
  end

  create_table(:posts, force: true) do |t|
    t.string :title
    t.belongs_to :category
    t.belongs_to :user
    t.boolean :published
  end

  create_table(:rgb_colors, force: true) do |t|
    t.string :code
    t.text :description
  end

  create_table(:internal_tag_names, force: true) do |t|
    t.string :name
    t.text :description
    t.integer :color_id
  end

  create_table(:option_types, force: true) do |t|
    t.string :name
  end

  create_table(:option_values, force: true) do |t|
    t.string :value
    t.belongs_to :option_type
  end

  create_table(:products, force: true) do |t|
    t.string :name
    t.belongs_to :option_type
  end

  create_table(:variants, force: true) do |t|
    t.integer :price
    t.belongs_to :product
    t.belongs_to :option_value
  end

  create_table(:users, force: true) do |t|
    t.string :name
  end
end
