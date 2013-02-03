class SurveysController < ApplicationController

	require 'rubygems'
	require 'twilio-ruby'

	before_filter :require_user

	def new
		@survey = Survey.new
		account_sid = 'ACc64d9ba6b024d108b9efd56d905b1c7f'
		auth_token = '1561a5d67c1c765ccbc0b5a76fc310e3'
		@client = Twilio::REST::Client.new account_sid, auth_token
		@call = @client.account.calls.create(
  	:from => '+1 567-623-8300',   # From your Twilio number
  	:to => '+91 9941751339',     # To any number
  	# Fetch instructions from this URL when the call connects
  	:url => new_call_survey_path(2)
		)

	end

	def new_call
		render :file => '/surveys/new_call.xml'
	end

	def create
		@survey = Survey.new(params[:survey])
		@survey.user_id = current_user.id
		if @survey.save
			flash[:notice] = "Thank you for taking up the survey"
		else
			flash[:error] = "Sorry! something went wrong"
		end
		redirect_to root_path
	end

end