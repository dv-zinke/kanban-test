class AddUserToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :user, foreign_key: true
    Post.update_all(user_id: 1)
    change_column_null :posts, :user_id, false
  end
end
