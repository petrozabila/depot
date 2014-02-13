class OrderNotifier < ActionMailer::Base
  default from: "Peter <depot@example.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject

  def received(order)
    @order = order

    mail to: order.email, subject: 'Verifying order submission in the Shop'
  end 
  #
  def shipped
    @greeting = "Hi"

    mail to: order.email, subject: 'Your order from the Shop is shipped'
  end
end
