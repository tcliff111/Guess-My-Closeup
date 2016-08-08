class QuizController < ApplicationController

	before_action :authenticate_user!, except: [:index]

	def index

	end

	def stats
		@answers = current_user.answers

		@correct_answers = []
		@incorrect_answers = []

		@answers.each do |answer|
			if answer.choice.correct
				@correct_answers.push answer
			else
				@incorrect_answers.push answer
			end
		end

		@percentage = (100 * @correct_answers.count.to_f / (@correct_answers.count + @incorrect_answers.count)).round(2)
	end

	def leaderboard

		@users = User.all.sort_by(&:skill_score)


	end


end
