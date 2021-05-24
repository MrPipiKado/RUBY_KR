class UploadsController < ApplicationController
    def new
    end
  
    def create
      # Make an object in your bucket for your upload
      obj = S3_BUCKET.bucket(BUCKET_NAME).object(params[:file].original_filename)
  
      # Upload the file
      obj.put(body: params[:file].to_io)
  
      # Create an object for the upload
      @upload = Upload.new(
              url: obj.public_url,
          name: obj.key
          )
  
      # Save the upload
      if @upload.save
        redirect_to uploads_path, success: 'File successfully uploaded'
      else
        flash.now[:notice] = 'There was an error'
        render :new
      end
    end
  
    def index
        @uploads = Upload.all
    end
  end