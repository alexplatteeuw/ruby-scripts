# frozen_string_literal: true

# !/usr/bin/env ruby

# place this file somewhere in your $PATH (e.g. /usr/local/bin)
# rename it from nav.rb to nav
# make it executable: chmod +x nav
# use it: nav my_repo

require 'pathname'
require 'fileutils'

project_name = ARGV[0]
search_dir   = Pathname.new("#{Dir.home}/code")
results      = search_dir.glob("**/#{project_name}")
project_dir  = results.find { |dir| dir.to_s =~ /#{search_dir}\/\w*\/*#{project_name}/ }

if project_dir.nil?
  puts "Could not find any directory named \"#{project_name}\" in #{search_dir}"
  return
end

FileUtils.chdir(project_dir)
system 'code .'
