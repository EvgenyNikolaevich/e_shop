# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisburseOrdersJob, type: :job do
  subject { described_class.new.perform(args) }

  describe '.perform' do
    context 'when the job successfully ran on Monday' do
      let(:args) { {} }

      it 'calls services' do
        expect(Services::DisburseOrders).to receive(:call)
        expect(Services::SaveDisbursedOrders).to receive(:call)

        subject
      end

      xit 'schedule job on the next Monday' do
      end
    end

    context 'when the job unsuccessfully ran on Monday' do
      let(:args) { {} }

      context 'and one of the services failing' do
        before { allow(Services::DisburseOrders).to receive(:call).and_raise(:CustomError) }

        xit 'reschedules job' do
        end
      end
    end
  end
end
