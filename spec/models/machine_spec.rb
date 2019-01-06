require 'rails_helper'

describe Machine do
  describe 'Instance methods' do
    it 'can average price' do

      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      snack2 = machine.snacks.create(title: 'Meal', price: 20)
      average_price = (snack.price + snack2.price) / 2

      expect(machine.average_price.to_i).to eq(average_price)
    end
  end
end


