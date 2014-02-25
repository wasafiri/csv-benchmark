require 'benchmark'

require 'csv'           #fastercsv is the built-in csv library as of ruby 1.9
require 'smarter_csv'
require 'ccsv'

['csv/presidents.csv', 'csv/geoip.csv'].each do |file|
  puts "\nTesting #{file}\n\n"

  Benchmark.bm do |x|

    x.report('CSV         ') do
      CSV.foreach(file, :col_sep =>',') {|row| row}
    end

    x.report('smarter_csv ') do
      SmarterCSV.process(file, {:col_sep => ','}) {|row| row}
    end

    x.report('ccsv        ') do
      Ccsv.foreach(file) {|row| row}
    end
  end
end
