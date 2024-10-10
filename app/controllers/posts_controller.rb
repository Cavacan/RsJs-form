class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      tags_names = params[:post][:tags].presence 
      tags = tags_names.split(",").map(&:strip).uniq
      tags.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name)
        @post.tags << tag unless @post.tags.include?(tag)
      end
      redirect_to posts_path, status: :created, notice: 'Post created.'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated.'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, notice: 'Post destroyed.'
  end

  private

  def post_params
    params.require(:post).permit(%i[name body])
  end
end
