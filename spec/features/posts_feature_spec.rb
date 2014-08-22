require 'rails_helper'

describe 'Posts' do
	context 'Without posts' do

		it 'Shows a message' do
			visit '/posts'
			expect(page).to have_content 'No posts have been added'
		end
	end

	context 'With posts' do
		before(:each) do
			Post.create(text: 'Challenge day at makers academy')
		end

		it 'Shows all posts' do
			visit '/posts'
			expect(page).to have_content 'Challenge day at makers academy'
		end
	end 
end