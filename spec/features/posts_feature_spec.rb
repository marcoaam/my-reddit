require 'rails_helper'

describe 'Posts' do
	context 'Without posts' do

		it 'Shows a message' do
			visit '/posts'
			expect(page).to have_content 'No posts have been added'
		end

	end
end