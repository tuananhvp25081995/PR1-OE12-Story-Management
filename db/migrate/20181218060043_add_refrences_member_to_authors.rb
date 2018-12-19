class AddRefrencesMemberToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_reference :authors, :member
  end
end
