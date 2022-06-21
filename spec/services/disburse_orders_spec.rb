# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::DisburseOrders do
  subject { described_class.call(params) }

  describe '.call' do
    context 'when completed orders exist' do
      let(:merchant) { create(:merchant) }
      let(:shopper)  { create(:shopper) }
      let!(:orders)  do
        create_list(:order, 5, completed_at: '2022-06-14'.to_time, merchant_id: merchant.id, shopper_id: shopper.id)
      end
      let(:params) { { start_at: '2022-06-13'.to_time, end_at: '2022-06-19'.to_time } }

      it { is_expected.to be_an_instance_of(Array) }
      it { expect(subject.size).to eq(5) }
    end

    context 'when completed orders does not exist' do
      let(:merchant) { create(:merchant) }
      let(:shopper)  { create(:shopper) }
      let!(:orders)  { create_list(:order, 5, merchant_id: merchant.id, shopper_id: shopper.id) }
      let(:params)   { { start_at: '2022-06-13'.to_time, end_at: '2022-06-19'.to_time } }

      it { is_expected.to be_an_instance_of(Array) }
      it { is_expected.to be_empty }
    end
  end
end
