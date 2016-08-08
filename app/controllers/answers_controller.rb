class AnswersController < ApplicationController

	before_action :authenticate_user!

	def create

		@answer = Answer.create(answer_params)

		# Your answer: @answer.choice.text was @answer.choice.correct .
		# The correct answer was params[:correct_answer]

		flash[:your_answer] = @answer.choice.text
		flash[:is_correct] = @answer.choice.correct
		flash[:correct_answer] = params[:correct_answer]

		puts "Answer is #{params[:correct_answer]}"

		redirect_to :controller => :sounds, :action => :play
	end

	private

	def answer_params
		params[:answer].permit(:choice_id, :user_id)
	end

end
