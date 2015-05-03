require "sinatra/jshlp/version"

module Sinatra
	
  module JSHlp
    
		def jslink(link)
			@jslinks ||= []
			@jslinks << link
		end
		
		def csslink(link)
			@csslinks ||= []
			@csslinks << link
		end
		
		def jscode(code)
			@jscodes ||= ""
			@jscodes << (code + "\n")
		end
		
		def jslinks
			return "" unless @jslinks
			links = @jslinks.compact
			code = ""
			links.each do |link|
				code << "<script src='#{link}'></script>\n"
			end
			code
		end
		
		def jscodes
			return "" unless @jscodes
			"<script>#{@jscodes}</script>"
		end
		
		def javascripts
			"#{jslinks}\n#{jscodes}"
		end
		
		def stylesheets
			return "" unless @csslinks
			links = @csslinks.compact
			code = ""
			links.each do |link|
				code << "<link rel='stylesheet' href='#{link}' />"
			end
			code
		end
		
		def jslib(name)
			@jslibs ||= [] # уже подключённые библиотеки
			return if @jslibs.include? name
			@jslibs << name
			case name
			when "datetimepicker"
				jslink "/lib/datetimepicker/jquery.datetimepicker.js"
				csslink "/lib/datetimepicker/jquery.datetimepicker.css"
			else
				raise "Not know this javascript library: #{name}"
			end
		end
		
		def jslibreg(libs)
			@jslibs ||= ""
		end
		
  end
	
	helpers JSHlp
	
end
