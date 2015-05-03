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
			@jslibsreg ||= {} # зарегистрированные библиотеки
			raise "Not know this jslib: #{name}" unless @jslibsreg.include? name
			@jslibsreg[name][:jslinks].each{ |l| jslink l }
			@jslibsreg[name][:csslinks].each{ |l| csslink l }
		end
		
		def jslibreg(args)
			@jslibsreg ||= {} # зарегистрированные библиотеки
			name = args[:name]
			raise "JSlib name must be set!" unless name
			@jslibsreg[name] = {
				jslinks: args[:jslinks] ||= [],
				csslinks: args[:csslinks] ||= []
			}
		end
		
  end
	
	helpers JSHlp
	
end
