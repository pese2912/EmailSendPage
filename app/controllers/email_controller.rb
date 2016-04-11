require 'mailgun'
class EmailController < ApplicationController
    def write
        
    end
    def sendmail
        @title=params[:title]
        @address = params[:address]
        @content = params[:content]
        
        mg_client = Mailgun::Client.new("key-ecae1350864a603328675318f3f3d3be")

        message_params =  {
                   from: 'admin@naver.com',
                   to:    @address,
                   subject: @title,
                   text:    @content
                  }

        result = mg_client.send_message('sandbox27485e37f2d14d439a8be17636bb4593.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']
    end
 
        
end
