module AccountMgmt
  def cancel_account!
    puts "Account cancelled for #{name}"
  end

  def update_billing(details)
    @billing_details = details
  end
end

current_user.extend AccountMgmt
current_user.update_billing("New details")
