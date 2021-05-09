class PostsController < ApplicationController
    def index 
      @posts = Post.all
    end

    def show 
      load_post
    end

    def new
      @post = post.new
    end
    
    def create_table 
      @post = post.new(post_params)
      @post.save
      redirect_to: show
    end

    def edit
      load_post
    end

    def update
      load_post
      @post.update(post_params)
      redirect_to :show
    end

    def delete
      load_post
      @post.destroy
      redirect_to index
    end
    private

    def post_params
      params require(:post).permit(:title, :text)
    end

    def load_post
      @post = Post.find(params[:id])
    end
end
