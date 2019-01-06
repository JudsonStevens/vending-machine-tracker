require 'rails_helper'

describe 'User' do
  context 'visits a vending machine show page' do
    it 'should see an average price of all snacks in that machine' do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      snack2 = machine.snacks.create(title: 'Meal', price: 20)

      visit(machine_path(machine))

      expect(page).to have_content(Snack.average(:price))

    end
  end
end