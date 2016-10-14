class ArticlesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_article, only:[:show , :edit, :destroy, :update]
  before_action :only_current_user, only:[:edit, :update]
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = current_user.articles.build(articleParam)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end
  
  def show
  
  end
  
  def edit 
    
    
  end
  
  def update
    
    if @article.update(articleParam)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash.now[:danger] = "Article has not been updated"
      render :edit
    end
  end
  
  def destroy
    
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    end
      
  end
  
  
  private
    def articleParam
     params.require(:article).permit(:body,:title)
    end
    
    def set_article
      @article = Article.find(params[:id])
    end
    
    def only_current_user
      if @article.user != current_user
        flash[:danger] = "You can only edit your own article"
        redirect_to root_path
      end
      
    end
end
