require 'spec_helper'

describe Sinatra::JSHlp do
	include Rack::Test::Methods
	
	before :each do
		@app = Sinatra.new do
			register Sinatra::JSHlp
			enable :inline_templates
			get '/' do erb :index end
			get '/green' do erb :green end
			get '/red' do erb :red end
			get '/yellow' do erb :yellow end
			configure do
				jslibreg(
					name: "greenlib",
					jslinks: ["/js/green.js"],
					csslinks: ["/css/green.css"],
				)
				jslibreg(
					name: "redlib",
					jslinks: ["/js/red.js"],
					csslinks: ["/css/red.css"],
				)
			end
		end
	end
	
	def app
    @app
  end
	
  it 'app with jslibreg' do
		get "/"
		expect(last_response.status).to eq(200)
    expect(last_response.body).to match(/Main Page/)
	end
	
	it 'jslib in view' do
		get "/green"
		expect(last_response.status).to eq(200)
		expect(last_response.body).to match(/Green Page/)
    expect(last_response.body).to match(/Green!/)
  end
	
	it 'jscode in view' do
		get "/red"
		expect(last_response.status).to eq(200)
    expect(last_response.body).to match(/Red Page/)
		expect(last_response.body).to match(/red.js/)
		expect(last_response.body).to match(/red.css/)
  end
	
	it 'jslink and csslink in view' do
		get "/yellow"
		expect(last_response.status).to eq(200)
    expect(last_response.body).to match(/Yellow Page/)
		expect(last_response.body).to match(/yellow.js/)
		expect(last_response.body).to match(/yellow.css/)
  end	
end

__END__

@@ layout
<html>
<head>
  <%= stylesheets %>
</head>
<body>
  <%= yield %>
  <%= javascripts %>
</body>
</html>


@@ index
<h1>Main Page</h1>


@@ green
<% jscode "alet('Green!');" %>
<h1>Green Page</h1>


@@ red
<% jslib "redlib" %>
<h1>Red Page</h1>


@@ yellow
<%
	jslink "/js/yellow.js"
	csslink "/css/yellow.css"
%>
<h1>Yellow Page</h1>
