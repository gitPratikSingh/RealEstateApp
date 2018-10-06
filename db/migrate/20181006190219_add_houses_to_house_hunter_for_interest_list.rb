class AddHousesToHouseHunterForInterestList < ActiveRecord::Migration[5.2]
  def change
    change_table :house_hunters do |t|
      t.belongs_to :house, foreign_key: true, optional: true
    end
  end
end
