#!/usr/bin/env ruby
require 'nokogiri'
require File.expand_path("lib/enumerable_one", File.dirname(__FILE__))
require File.expand_path("lib/svg_glyph", File.dirname(__FILE__))
require File.expand_path("lib/svg_font", File.dirname(__FILE__))

text_input       = ARGV[0]
svg_font_file    = ARGV[1]
svg_output  = ARGV[2] ? File.open(ARGV[2], "w") : $stdout.dup


#Currently use 14 as default, color black
#TODO expose size and color
svg_letter_size = 14
svg_color = "black"

font = SVGFont.new(svg_font_file)
svg_output  = File.open(text_input.hash().to_s() + ".svg", "w")
#the height and width could depend on the font used.
#TODO expose widht and height
svg_output.puts('<svg version="1.1" baseProfile="full" height="' + (svg_letter_size * 1.25).round.to_s + '" width="' + (7.5 * text_input.size).round.to_s + '" xmlns="http://www.w3.org/2000/svg">')
svg_output.puts font.tspanToPath(text_input,0,svg_letter_size,svg_letter_size,svg_color,Hash.new)
svg_output.puts '</svg>'
svg_output.close
