class UpdateComments < ActiveRecord::Migration
  def change
    add_column(:comments, :movie_id, :integer)
  end
end
