# Add a declarative step here for populating the DB with movies.

Given /^the following movies exist:$/ do |movies_table| 
  movies_table.hashes.each do |movie|
  	Movie.create!(movie) 
  	# each returned element will be a hash whose key is the table header. You should arrange to add that movie to the database here.   
  end
end


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


When /^I press (.*)$/ do |submit_ratings|
	click_button(submit_ratings)
end


Then /^I should see: (.*)$/ do |movies|
	individual_movies = movies.split(", ")
	individual_movies.each do |movie|
		if page.respond_to? :should
    	page.should have_content(movie)
  	else
    	assert page.has_content?(movie)
  	end
  end
end


And /^I should not see: (.*)$/ do |movies|
	individual_movies = movies.split(", ")
	individual_movies.each do |movie|
	  if page.respond_to? :should
  	  page.should have_no_content(movie)
  	else
    	assert page.has_no_content?(movie)
  	end
	end
end

	
Then /^I should not see any movies$/ do
end


Then /^I should see all movies$/ do
	page.all("table#movies tbody tr").count.should == 10
	
	#rows = count("table#movies tbody tr")
	#assert rows.should == 10
end


When /^I follow (.*)$/ do |link|
  click_link(link)
end


Then /^I should see (.*) before (.*)$/ do |e1, e2|
  page_as_array = page.body.split(" ")
  first_movie = page_as_array.index("<td>#{e1}</td>")
  second_movie = page_as_array.index("<td>#{e2}</td>")
  
  assert first_movie.should < second_movie #should not necessary
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"


