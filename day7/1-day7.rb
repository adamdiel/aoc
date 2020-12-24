#!/usr/bin/env ruby

def find_count(rules, bags, count)


  bag = bags.pop()

  rules.each do | parent, child |
    match = child.select{ | key, value | key.include?(bag[0..-3])}
    unless match.empty?
      bags << parent
      count += 1
    end 
  end

  if bags.length() == 0 
    return count
  else
    count = find_count(rules, bags, count)
  end
end

def add_child(children)
  child_hash = Hash.new
  children = children.split(",")
  children.each do | child |
    child = child.split(" ", 2)
    child_hash[child[1]] = child[0]
  end
  child_hash
end



def add_rule(rule, rules)
  rule = rule.split("contain")
  parent = rule[0]
  children = rule[1]
  children = add_child(children)
  rules[parent] = children
  rules
end

filename = ARGV[0]

rules = Hash.new
File.readlines(filename).each do |line|
  rules = add_rule(line.chomp, rules)
end

parents = ["shiny gold bag"]
count = 0
puts find_count(rules, parents, count)
