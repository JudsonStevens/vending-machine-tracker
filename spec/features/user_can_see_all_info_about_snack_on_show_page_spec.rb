require 'rails_helper'

describe 'User' do
  context 'visits a snack show page' do
    it 'should see the name of the snack, snack price' do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      machine1 = snack.machines.create(location: 'Your dads')

      visit(snack_path(snack))

      expect(page).to have_content(snack.title)
      expect(page).to have_content(snack.price)
    end
  
    it "should see the list of locations with vending machines that carry that snack" do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      machine1 = snack.machines.create(location: 'Your dads', owner: owner)

      visit(snack_path(snack))

      expect(page).to have_content(machine.location)
      expect(page).to have_content(machine1.location)
    end

    it "should see average price for snacks in those vending machines" do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      machine1 = snack.machines.create(location: 'Your dads', owner: owner)

      visit(snack_path(snack))

      expect(page).to have_content(machine.average_price)
      expect(page).to have_content(machine1.average_price) 
    end

    it "should see count of different kinds of items in the vending machine" do
      owner = Owner.create(name: 'BillyBob')
      machine = owner.machines.create(location: 'Your moms')
      snack = machine.snacks.create(title: 'Homecooked', price: 15)
      machine1 = snack.machines.create(location: 'Your dads')

      visit(snack_path(snack))

      expect(page).to have_content(machine.total_count)
      expect(page).to have_content(machine1.total_count)
    end
  end
end  
      
    