# frozen_string_literal: true

class DisburseOrdersJob
  include Sidekiq::Job

  def perform(*args)
    next_run = Time.now.next_week.beginning_of_week

    ActiveRecord::Base.transaction do
      disbursed_orders = Services::DisburseOrders.call(args)
      Services::SaveDisbursedOrders.call(disbursed_orders)
    end
  end
end
