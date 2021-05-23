class PostsController < ApplicationController
    def index

      if params[:search].present?
        @posts = Post.search_by_starts_with(params[:search]).paginate(page: params[:page], per_page: 2)
      end
      
      if params[:category_id]
        @category = Category.find(params[:category_id])
        @posts = @category.posts.ordered.with_categories.paginate(page: params[:page], per_page: 2)
      end
      
      @posts ||= Post.with_categories.paginate(page: params[:page], per_page: 2)
    end

    def show 
      load_post
    end

    def new
      #load_categories
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      @post.save
      redirect_to @post
    end

    def edit
      #load_categories
      load_post
    end

    def update
      load_post
      @post.update(post_params)
      redirect_to @post
    end

    def delete
      load_post
      @post.destroy
      redirect_to :posts
    end
    private

    def post_params
      params.require(:post).permit(:title, :text, :category_id)
    end

    def load_post
      @post = Post.find(params[:id])
    end

    #def load_categories
     # @categories = Category.all
    #end
end
