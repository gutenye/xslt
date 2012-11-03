#!/usr/bin/env ruby

require "pd"
require "nokogiri"
require "optparse"

options = {}
OptionParser.new do |opt|
	opt.banner = "Usage: ./xslt [options] <stylesheet> <file ..>"

	opt.on("-p", "--param 'key:value ..'", "parameter") do |v|
		options["param"] = v.split(/ +/).map{|v| v.split(':')}.flatten
	end
end.parse!

xslt = Nokogiri::XSLT(File.read($*[0]))
html  = Nokogiri::HTML(File.read($*[1]))
ret = xslt.transform(html, Nokogiri::XSLT.quote_params(options["param"] || {}))
ret = ret.children[0].inner_text

pd ret
puts "="*20
puts ret.strip # need strip.
