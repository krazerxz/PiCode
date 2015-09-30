task default: [:rubocop, :spec, :ok]

task :ok do
  puts "s'all good"
end
