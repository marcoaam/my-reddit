require 'rails_helper'

RSpec.describe Comment, :type => :model do
	context 'Likes' do

		before(:each) do
			user = User.create(username: 'marco', email: 'm@m.com', password: '12345678', password_confirmation: '12345678')
			user2 = User.create(username: 'marco2', email: 'm@m2.com', password: '12345678', password_confirmation: '12345678')
			comment = Comment.create(thoughts: 'Challenge day at makers academy', user: user)
			comment.likes.create(user_id: user.id)
			comment.likes.create(user_id: user2.id)
		end

		let(:comment) { Comment.first }

	  it 'calculates the total points' do
	  	expect(comment.total_points).to eq 2
	  end

	end

end
