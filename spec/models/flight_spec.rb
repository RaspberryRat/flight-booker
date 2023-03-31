require 'rails_helper'

RSpec.describe Flight, type: :model do

  context 'date in Time format' do
    it 'converts to Month Day Year format'
    flight = FactoryBot.create(
      :departure_time,
      value: '2023-03-30 16:35:02.554892 -0600'
    )

    expect(Flight.departure_date_formatted).to eq('March 3, 2023')
  end

end
