#!/usr/bin/env ruby

def question_count(custom_form)
  party_count = custom_form.scan(/\n/).count + 1

  people = custom_form.split(" ")

  answer_hash = Hash.new(0)
  people.each do | answers | 
    answers.split('').each do | answer|
      answer_hash[answer] += 1
    end
  end

  count = answer_hash.select{ | key, value| value == party_count}.count

  return count
end

filename = ARGV[0]
customs_file = File.open(filename)
customs = customs_file.read


customs = customs.split(/\n{2,}/)

valid_count = 0
customs.each do |custom|
  valid_count += question_count(custom)
end

puts valid_count