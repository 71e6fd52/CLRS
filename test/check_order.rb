#!/usr/bin/env ruby

puts gets.chomp.split(' ').map(&:to_i).each_cons(2).all? { |a, b| (a <=> b) < 1 }
