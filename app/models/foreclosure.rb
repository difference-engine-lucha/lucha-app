
class Foreclosure < ActiveRecord::Base
  validates_uniqueness_of :client_id
  validates_presence_of :client

  validates :originating_lender, :original_loan_number, :servicer, :servicer_loan_number, :monthly_mortgage_payment, :loan_term, presence: true

  validates :been_to_court, :inclusion => {:in => [true, false]}
  validates :working_with_lawyer, :inclusion => {:in => [true, false]}
  validates :working_w_agency, :inclusion => {:in => [true, false]}
  validates_date :origination_date, :on_or_before => lambda { Date.current }

  validates_presence_of :court_case_number, :if => :been_to_court?

  belongs_to :client

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |foreclosure|
        csv << foreclosure.attributes.values_at(*column_names)
      end
    end
  end

  def pretty_time
    created_at.strftime("%A, %b %d")
  end
end
