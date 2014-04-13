class OrderMailer < ActionMailer::Base
  def send_order_completed_mail(user, order)
    @user = user
    @order = order
    mail(to: @user.email,
      subject: "Order #{@order.id} Completed")
  end
end
