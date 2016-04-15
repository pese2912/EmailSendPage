require 'mailgun'

class EmailController < ApplicationController
    
    def write
    
    end
    
    
    def sendmail
        @title=params[:title]
        @address = params[:address]
        @content = params[:content]
    
        new_post = Post.new 
        
        new_post.title = @title    
        new_post.content = @content
        new_post.address = @address
        new_post.save 
        
     #   mg_client = Mailgun::Client.new("key-ecae1350864a603328675318f3f3d3be")
     #
     #
     #   message_params =  {
     #              from: 'admin@naver.com',
     #              to:    @address,
     #             subject: @title,
     #              text:    @content
     #             }
     
     #   result = mg_client.send_message("sandbox27485e37f2d14d439a8be17636bb4593.mailgun.org", message_params).to_h!
     #  message_id = result['id']
     #   message = result['message']
     
    end
    
    
    def list
         @every_post = Post.all.order("id desc")
    end
    
    def delete
        @destroy_post = Post.find(params[:id])
        @destroy_post.destroy
        redirect_to '/list'
    end
    
end
