module Cloudkey
  class Media < Client
    def embedded_url id, security_level = SecurityPolicy.new
      url = "#{@api.base_url}/embed/#{@api.user_id}/#{id}"      
      API.sign_url url, @api.key, security_level
    end
    
    def stream_url id, asset_name="mp4_h264_aac", security_level=SecurityPolicy.new, cdn_url='http://cdn.dmcloud.net'
      url = "#{cdn_url}/route/#{@api.user_id}/#{id}/#{asset_name}.#{asset_name.split('_')[0]}"
      API.sign_url url, @api.key, security_level
    end

    def download_url id, asset_name="mp4_h264_aac", security_level=SecurityPolicy.new, cdn_url='http://cdn.dmcloud.net'
      url = "#{cdn_url}/route/http/#{@api.user_id}/#{id}/#{asset_name}.#{asset_name.split('_')[0]}"
      API.sign_url url, @api.key, security_level
    end

    def url_components id, asset_name="mp4_h264_aac", security_level=SecurityPolicy.new, cdn_url='http://cdn.dmcloud.net'
      {:cdn_url => cdn_url, :user_id => @api.user_id, :id => id, :asset_name => asset_name}
    end

    def sign_url(url)
      API.sign_url url, @api.key, security_level
    end

  end
end