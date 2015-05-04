require 'sinatra/base'

module Sinatra
	
  module JSHlp
    
		module Helpers
			
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
				libsreg = self.class.jshlp[:libsreg]
				raise "Not know this jslib: #{name}" unless libsreg.include? name
				libsreg[name][:jslinks].each{ |l| jslink l }
				libsreg[name][:csslinks].each{ |l| csslink l }
			end
			
		end
		
		def self.registered(app)
			app.helpers JSHlp::Helpers
			
			app.set :jshlp, {
				libsreg: {}, # зарегистрированные библиотеки
			}
		end
		
		def jslibreg(args)
			libsreg = jshlp[:libsreg]
			name = args[:name]
			raise "JSlib name must be set!" unless name
			libsreg[name] = {
				jslinks: args[:jslinks] ||= [],
				csslinks: args[:csslinks] ||= []
			}
		end
		
  end

	register JSHlp
	
end
