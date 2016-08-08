class User < ActiveRecord::Base

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :answers
    has_many :sounds


    def skill_score
    	correct_count = 0
    	self.answers.each do |answer|
    		if answer.choice.correct
    			correct_count = correct_count + 1
    		end
    	end
    	return correct_count
    end

    def wrong_count
    	wrong_count = 0
    	self.answers.each do |answer|
    		if !(answer.choice.correct)
    			wrong_count = wrong_count + 1
    		end
    	end
    	return wrong_count
    end

end
