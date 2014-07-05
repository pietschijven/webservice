class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :api_keys, :acces_token, :access_token
  end
end
