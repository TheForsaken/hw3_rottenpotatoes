
# BUTTON PRESS
When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
  Movie.create(:title => movie[:title],
               :rating => movie[:rating],
               :release_date => movie[:release_date])
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
=begin 
  steps in lines 89-95 of web_steps.rb
=end
  rating_list.split(', ').each do |rating|
		if uncheck.nil?
			check("ratings_"+rating)
			#step "I check #{rating}"
		else
			uncheck("ratings_"+rating)
			#step "I uncheck #{rating}"
		end
  end
end

Then /^I should see all of the movies$/ do
  #Count rows of css table#movies tr)
  page.all('table#movies tr').count.should == 11
end


