# Add a declarative step here for populating the DB with movies.

Given /^the following movies exist:$/ do |movies_table| 
  movies_table.hashes.each do |movie|
  	Movie.create!(movie)
    # each returned element will be a hash whose key is the table header. You should arrange to add that movie to the database here.   
  end
  #flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

Given /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
	ratings = rating_list.split(", ")
	ratings.each do |rating|
		if uncheck 
			uncheck("ratings_#{rating}")
		else
			check("ratings_#{rating}")
		end
	end
end
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#end

When /^I press (.*)$/ do |button|
	click_button(button)
end

Then /^I should see: (.*)$/ do |films|
	#films.split(", ")
end

And /^I shouldn't see: (.*)$/ do |films|
end

# SCENARIO: NO RATINGS SELECTED
#Given /^I uncheck (.*)$/ do |field|
#  uncheck(field)
#end --> step already exists

#When I press ratings_submit --> already exists

#Then I should see: no movies

# SCENARIO: ALL RATINGS SELECTED --> steps already exist
#Given I check the following ratings: PG, R, NC-17, PG-13, G
#	When I press ratings_submit
#	Then I should see: all of the movies



