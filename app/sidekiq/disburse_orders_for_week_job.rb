# frozen_string_literal: true

# Disburse completed orders for one week
class DisburseOrdersForWeekJob < ApplicationJob
  retry_on ActiveRecord::NotNullViolation, wait: 5.minutes, queue: :low_priority

  def perform(_args)
    next_run   = Time.zone.now.prev_week
    end_at     = Time.zone.now.prev_week.end_of_week
    date_range = { start_at: next_run, end_at: end_at }

    ActiveRecord::Base.transaction do
      disbursed_orders = Services::DisburseOrders.call(date_range)

      Services::SaveDisbursedOrders.call(disbursed_orders)
      DisburseOrdersForWeekJob.perform_later(next_run, date_range)
    end
  end
end
