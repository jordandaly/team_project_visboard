class SavingsDeposit < ActiveRecord::Base
  belongs_to :goal
  
  def self.total_on(date)
    where("date(date) = ?", date).sum(:amount) 
  end
end
