require 'erb'

kids_data      = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_sample_letter.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name      = kid_data_array[0]
  behaviour = kid_data_array[1]
  toys      = kid_data_array[2..7]
  infraction = kid.split('  |  ')[1]

  next unless behaviour == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
