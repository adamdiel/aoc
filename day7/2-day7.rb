#!/usr/bin/env ruby

def find_count(rules, bag)
  bag_count = 0
  rules.each do | parent_bag, child_bags | 
    if parent_bag.include?(bag.chomp("."))
      child_bags.each do | child_bag, child_count |
        child_bag_count = (child_count.to_i * find_count(rules, child_bag))
        if child_bag_count == 0
          bag_count += child_count.to_i
        else
          bag_count += child_bag_count + child_count.to_i
        end
      end
    end
  end
  bag_count
end

def add_child(children)
  child_hash = Hash.new
  if children.include?"no other bags."
    return child_hash 
  end
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

def get_child_bag_count(bag_hash)
  bag_count = 0
  bag_hash.each do | bag, count |
    bag_count += count.to_i
  end
  bag_count
end

filename = ARGV[0]

rules = Hash.new
File.readlines(filename).each do |line|
  rules = add_rule(line.chomp, rules)
end

bag = "shiny gold bag"
bag_count = find_count(rules, bag)

puts bag_count