describe 'CashRegister' do
  let(:cash_register) { CashRegister.new }
  let(:cash_register_with_discount) { CashRegister.new(20) }

  describe '::new' do
    it 'sets an instance variable @total on initialization to zero' do
      expect(cash_register.instance_variable_get(:@total)).to eq(0)
    end

    it 'optionally takes an employee discount on initialization' do
      expect(cash_register_with_discount.discount).to eq(20)
    end
  end

  describe '#total' do
    it 'returns the current total' do
      cash_register.total = 100
      expect(cash_register.total).to eq(100)
    end
  end

  describe '#add_item' do
    it 'accepts a title and a price and increases the total' do
      expect{cash_register.add_item("eggs", 0.98)}.to change{cash_register.total}.by(0.98)
    end

    it 'also accepts an optional quantity' do
      expect{cash_register.add_item("book", 5.00, 3)}.to change{cash_register.total}.by(15.00)
    end

    it "doesn't forget about the previous total" do
      cash_register.add_item("Lucky Charms", 4.5)
      expect(cash_register.total).to eq(4.5)
      cash_register.add_item("Ritz Crackers", 5.0)
      expect(cash_register.total).to eq(9.5)
      cash_register.add_item("Justin's Peanut Butter Cups", 2.50, 2)
      expect(cash_register.total).to eq(14.5)
    end
  end

  
end
