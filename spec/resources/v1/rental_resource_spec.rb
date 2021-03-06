module V1
  RSpec.describe RentalResource do
    let :creatable_fields do
      [:title,
       :city,
       :bedrooms,
       :image,
       :daily_rent,
       :rent_payment_period,
       :rental_state,
       :property_type,
       :landlord].sort
    end

    subject do
      described_class.new Rental.new, {}
    end

    it 'has the expected creatable attributes' do
      expect(described_class.creatable_fields({}).sort).to eq creatable_fields
    end

    it 'has the expected updatable attributes' do
      expect(described_class.updatable_fields({}).sort).to eq creatable_fields
    end

    it 'has the expected fetchable attributes' do
      expect(subject.fetchable_fields.sort).to eq((creatable_fields + [:id, :created_at, :updated_at]).sort)
    end
  end
end
