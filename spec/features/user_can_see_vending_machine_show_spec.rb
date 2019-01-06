require 'rails_helper'

describe 'User' do
  context 'visits a show page' do
    it 'displays the name of all associated snacks with price' do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      snack2 = machine.snacks.create(title: 'Meal', price: 20)

      visit(machine_path(machine))

      expect(page).to have_content(snack.title)
      expect(page).to have_content(snack2.title)
      expect(page).to have_content(snack.price)
      expect(page).to have_content(snack2.price)
    end
  end
end