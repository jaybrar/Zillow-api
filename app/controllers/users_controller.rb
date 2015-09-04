class UsersController < ApplicationController
	# $zillow_uri = "http://www.zillow.com/webservice/mortgage/CalculateAffordability.htm?zws-id=X1-ZWz1a3x22zps0b_6a5jo&annualincome=1000000&monthlypayment=2000&down=800000&monthlydebts=1500&rate=&schedule=yearly&term=360&debttoincome=36&incometax=30&propertytax=20&hazard=20000&pmi=1000&output=json"
      $report
	def index
	end

	def affordability
	  url = "http://www.zillow.com/webservice/mortgage/CalculateAffordability.htm?zws-id=X1-ZWz1a3x22zps0b_6a5jo&annualincome=" + params["annualincome"] + "&monthlypayment=" + params['monthlypayment'] + "&down=" + params['down'] + "&monthlydebts=" + params['monthlydebts'] + "&rate=" +params['rate'] + '&schedule=' + params['schedule'] + '&term=' + params['term'] + "&output=json"
	  uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      
      #to be able to access https URL, these line should be added
      # http.use_ssl = true
      # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
      request = Net::HTTP::Get.new(uri.request_uri)
      response = http.request(request)
      
      #store the body of the requested URI
      data = response.body
      
      #JSON.load() turns the data into a hash
      results = JSON.load(data)
      $report = results
      render partial: "results", locals: {results: results}
	end

      def sends
            Results.send_report(params[:email], $report)
            json_message = {:message => "Thank you! Your Report Has Been Emailed To: #{params[:email]}"}
            render json: json_message
      end


end
