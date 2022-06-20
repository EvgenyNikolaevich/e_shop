# frozen_string_literal: true

module Services
  class DisburseOrders
    def self.call(params)
      new.call(params)
    end

    FEE = 
    {
      (0...50) => 1,
      (50...300) => 0.95,
      (300..Float::INFINITY) => 0.85
    }.freeze

    def call(params)
      valid_params = validate_params(params)
      orders       = find_completed_orders(valid_params[:start_at], valid_params[:end_at])

      calculate_disbursements(orders)
    end

    private

    private_constant :FEE

    def validate_params(params)
      { start_at: params[:start_at], end_at: params[:end_at] }
    end

    def find_completed_orders(start_at, end_at)
      Order.where('completed_at BETWEEN ? AND ?', start_at, end_at)
           .select(:id, :amount)
           .as_json
    end

    def calculate_disbursements(orders)
      orders.map do |order|
        FEE.each_pair do |range, fee_size|
          if range.include?(order[:amount])
            order[:disburse_amount] = order[:amount] * fee_size 

            break
          end
        end
      end
    end
  end
end