class ChangeDefaultUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user, :User, from: nil, to: ""
    change_column_default :user, :Name,from: nil, to: ""
    change_column_default :user, :Email,  from: nil, to: ""
    change_column_default :user, :Phone,  from: nil, to: ""
    change_column_default :user, :username,  from: nil, to: ""

    change_column_default :user, :password_digest,  from: nil, to: ""
  end
end
