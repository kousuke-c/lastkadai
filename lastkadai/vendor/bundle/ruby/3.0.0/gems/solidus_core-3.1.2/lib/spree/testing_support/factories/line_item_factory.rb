# frozen_string_literal: true

require 'spree/testing_support/factory_bot'
Spree::TestingSupport::FactoryBot.when_cherry_picked do
  Spree::TestingSupport::FactoryBot.deprecate_cherry_picking

  require 'spree/testing_support/factories/order_factory'
  require 'spree/testing_support/factories/product_factory'
end

FactoryBot.define do
  factory :line_item, class: 'Spree::LineItem' do
    quantity { 1 }
    price { BigDecimal('10.00') }
    order
    transient do
      product { nil }
    end
    variant do
      (product || create(:product)).master
    end
  end
end
