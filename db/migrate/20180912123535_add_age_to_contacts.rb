class AddAgeToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :age, :integer
  end
end
