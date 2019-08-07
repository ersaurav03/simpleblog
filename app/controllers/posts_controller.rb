class PostsController < ApplicationController
   http_basic_authenticate_with name: "Dhimana", password:"Saurav91#", except: [:index, :show]
   def index
    @heading = 'JSMPJ'
    @page='Home Page'
    @content='This is home page'
    @posts=Post.all
 end

 def show
    @post=Post.find(params[:id])
 end

 def new
    @post = Post.new
 end

 def edit
   @post=Post.find(params[:id])
 end

 def update
   @post=Post.find(params[:id])
   if(@post.update(post_params))
      redirect_to @post
      else
          render 'new'
   end
 end

 def create
#    render plain: sparams[:post].inspect
    @post = Post.new(post_params)
    if(@post.save)
    redirect_to @post
    else
        render 'new'
 end

 def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to posts_path
 end

end
 private def post_params
 params.require(:post).permit(:title, :body)
 end

end
