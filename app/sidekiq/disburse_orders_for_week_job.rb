# frozen_string_literal: true

# Disburse completed orders for one week
class DisburseOrdersForWeekJob < ApplicationJob
  retry_on ActiveRecord::NotNullViolation, wait: 5.minutes, queue: :low_priority

  def perform(*args)
    next_run = Time.zone.now.next_week.beginning_of_week
    end_at   = Time.zone.now.next_week.end_of_week

    ActiveRecord::Base.transaction do
      disbursed_orders = Services::DisburseOrders.call(args)

      Services::SaveDisbursedOrders.call(disbursed_orders)
      DisburseOrdersForWeekJob.perform_later(next_run, { start_at: next_run, end_at: end_at })
    end
  end
end
