class PaymentType < ActiveRecord::Base
  
  def payment_type_names
    PaymentType.all.select(:type_name).collect {|h| h.type_name}
  end
end
