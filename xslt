#!/usr/bin/env ruby

require "nokogiri"

xslt = Nokogiri::XSLT(File.read($*[0]))
html  = Nokogiri::HTML(File.read($*[1]))
puts xslt.transform(html)
