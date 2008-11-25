# http://github.com/ryanb/dotfiles/tree/master/Rakefile

require 'rake'
 
desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['**/*.vim'].each do |file|
    if File.exist?(File.join(ENV['HOME'], ".vim", file))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.vim/#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end
 
def replace_file(file)
  system %Q{rm "$HOME/.vim/#{file}"}
  link_file(file)
end
 
def link_file(file)
  puts "linking ~/.vim/#{file}"
  dest = File.join(ENV['HOME'], ".vim", file)
  dir = File.dirname(dest)
  create_directory(dir) unless File.exists?(dir)
  system %Q{ln -s "$PWD/#{file}" "#{dest}"}
end

def create_directory(dir)
  parent = File.dirname(dir)
  create_directory(parent) unless File.exists?(parent)
  Dir.mkdir(dir)
end

# taken and modified from http://github.com/bmabey/cucumber-tmbundle

class SyntaxGenerator
  def generate
    require 'yaml'
    require 'erb'
    require 'cucumber'

    scenario_keywords_array = []
    feature_keywords_array  = []
    step_keywords_array     = []

    Cucumber.config.each do |_, words|
      scenario_keywords_array << words.delete('scenario')
      feature_keywords_array << words.delete('feature')
      step_keywords_array.concat(words.values)
    end
    
    scenario_keywords = scenario_keywords_array.uniq.compact.sort
    feature_keywords  = feature_keywords_array.uniq.compact.sort
    step_keywords     = step_keywords_array.uniq.compact.sort

    all_keywords_array = scenario_keywords + feature_keywords + step_keywords

    scenario_keywords_regexp = scenario_keywords.join('|')
    feature_keywords_regexp  = feature_keywords.join('|')
    step_keywords_regexp     = step_keywords.join('|')

    template    = ERB.new(IO.read(File.dirname(__FILE__) + '/syntax/feature.vim.erb'))
    syntax      = template.result(binding)

    syntax_file = File.dirname(__FILE__) + '/syntax/feature.vim'
    File.open(syntax_file, "w") do |io|
      io.write(syntax)
    end
        
  end
end

namespace :syntax do
  desc 'Generates the plain text syntax file for all languages supported by Cucumber'
  task :generate do
    SyntaxGenerator.new.generate
  end
end
