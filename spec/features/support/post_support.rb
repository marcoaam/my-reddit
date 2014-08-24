def create_post(title, url, categories)
	visit '/posts'
	click_link 'New link post'
	fill_in 'Title', with: 'Web dev bootcamp'
	fill_in 'Url', with: 'http://www.makersacademy.com/'
	fill_in 'Categories', with: 'webdev'
	click_button 'Post'
end