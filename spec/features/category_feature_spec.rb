require 'rails_helper'

describe 'Category' do

	context 'Posts with a category' do

		before(:each) do
			user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			user.posts.create(title: 'Web dev bootcamp', url: 'http://www.makersacademy.com/', categories_list: 'webdev')
			user.posts.create(title: 'programming course', url: 'http://www.makersacademy.com/', categories_list: 'programming')
			login_as user
		end

		it 'can click a category link' do
			visit '/posts'
			click_link 'webdev'
			expect(page).to have_link 'Web dev bootcamp'
			expect(page).to have_content 'categories: webdev'
			expect(page).not_to have_content 'programming course'
		end

	end		

end