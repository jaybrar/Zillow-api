class Results < ApplicationMailer
  default from: 'notifications@example.com'
 
  def send_report(email, results)
  	@email = email
    @results = results
    mail(to: @email, subject: 'Here is Your Home Affordability Report')
  end

end
