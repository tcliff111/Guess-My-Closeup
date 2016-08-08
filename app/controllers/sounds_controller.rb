class SoundsController < ApplicationController

	before_action :authenticate_user!

	def new
		@sound = Sound.new

		4.times do
			@sound.choices.build
			@sound.choices.last.correct = false
		end

		@sound.choices.first.correct = true

	end

	def create

		puts params

		@sound = Sound.create(sound_params)

		flash[:errors] = []

		@sound.choices.each do |choice|
			flash[:errors].concat choice.errors.full_messages unless choice.valid?
		end

		if flash[:errors] == []
			flash[:success] = true
		end

		redirect_to new_sound_url
	end

	def play

		@sound = Sound.where("sounds.user_id != ?", current_user).order('RANDOM()').limit(1).first

		if @sound
			@choices = @sound.choices.shuffle

			for choice in @choices
				if choice.correct
					@correct_answer = choice.text
					break
				end
			end
		end
	end


	private

	def sound_params
		params[:sound].permit( :image, choices_attributes: [:text, :correct])
	end

end
