# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Services::SaveDisbursedOrders do
  subject { described_class.call(params) }

  describe '.call' do
    context 'when completed orders exist' do
      let(:merchant) { create(:merchant) }
      let(:shopper)  { create(:shopper) }
      let!(:order)   { create(:order, completed_at: '2022-06-14'.to_time, merchant_id: merchant.id, shopper_id: shopper.id) }
      let(:params)   { [{ id: order.id, amount: 0.51, start_at: '2022-06-13'.to_time, end_at: '2022-06-19'.to_time }] }

      it { is_expected.to be_an_instance_of(ActiveRecord::Result) }
    end

    context 'when completed orders does not exist' do
      let(:merchant) { create(:merchant) }
      let(:shopper)  { create(:shopper) }
      let!(:order)   { create(:order, completed_at: '2022-06-14'.to_time, merchant_id: merchant.id, shopper_id: shopper.id) }
      let(:params)   { [ { id: order.id, amount: 0.51, start_at: '2022-06-13'.to_time } ] }

      it { expect { subject }.to raise_error(ActiveRecord::NotNullViolation) }
    end
  end
end