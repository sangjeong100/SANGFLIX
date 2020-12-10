class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :movies, :rating, 0
    change_column_default :movies, :age_limit, 0
    change_column_default :movies, :number_of_copies, 0
  end
end
