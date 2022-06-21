# frozen_string_literal: true

module Services
  # Saves given disbursed orders into DB
  class SaveDisbursedOrders
    def self.call(params)
      new.call(params)
    end

    def call(params)
      valid_params = validate_params(params)

      save_disbursements(valid_params)
    end

    private

    def validate_params(params)
      params.map do |param|
        {
          order_id: param[:id],
          start_at: param[:start_at],
          end_at: param[:end_at],
          amount: param[:amount]
        }
      end
    end

    def save_disbursements(valid_params)
      Disbursement.insert_all!(valid_params)
    end
  end
end
