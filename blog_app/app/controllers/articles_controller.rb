class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(articleParam)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end
  
  def show
    @article = Article.find(params[:id])
    
    
    
  end
  
  
  private
    def articleParam
     params.require(:article).permit(:body,:title)
    end
end