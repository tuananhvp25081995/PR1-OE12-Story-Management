class AddRefrencesMemberToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :member
  end
end
