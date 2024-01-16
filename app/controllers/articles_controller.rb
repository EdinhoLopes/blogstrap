class ArticlesController < ApplicationController
  def index
    @highlights = Article.desc_order.first(3)
    
    current_page = (params[:page] || 1).to_i
    highlight_ids = @highlights.pluck(:id).join(',')

    @articles = Article.without_highligts(highlight_ids)
                       .desc_order
                       .page(current_page)

  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(articles_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])

    @article.destroy
    redirect_to root_path
  end
  
  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end
end
