
class StaticPagesController < ApplicationController
  def home
    info = []
    @photos = []
    if params[:id]
      FlickRaw.api_key = '0318133e8d6f08fffc58dfd0b994eb90'
      FlickRaw.shared_secret = '491797cfdedf88d4'
        @photosets = flickr.photosets.getList(user_id: params[:id])#params[:id])
      @photosets.each do |photoset|
        info << flickr.photosets.getInfo(:photoset_id => "72157662412685231")
      end
      info.each do |i|
         @photos << FlickRaw.url_b(i)
       end
    end
  end
end
