class ExampleMailer < ApplicationMailer

  default from: "mpetkovi@uno.edu"

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'You have created new event!',
                      :text    => 'To view ,edit or delete it, please log in into your account.'}
    mg_client.send_message ENV['domain'], message_params
  end

  def welcome_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
                      :subject => 'Welcome to Momemntum!',
                      :text    => 'Never forget another event! Easy access, free and fun. Just log in and let your brain rest. '}
    mg_client.send_message ENV['domain'], message_params
  end

end
