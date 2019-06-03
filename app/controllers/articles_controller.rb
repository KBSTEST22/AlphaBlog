class ArticlesController < ApplicationController
  before_start :tryingmethod , only: [:destroy]

  def new
      @article =Article.new
  end

  def create
    @article = Article.create(article_params_access)
    if (@article.save)
      flash[:notice] = "Customer saved successfully"
      redirect_to article_path(@article)
    else
      render "new"
    end


  end

  def show
    @articletobedisplayed =Article.find(params[:id])

  end

  def edit
    @articletoedit=Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if(@article.update(article_params_access))
      flash[:notice] = "Updated !"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end

  def destroy

    @article. destroy
    flash[:notice] = "Deleted !"
    redirect_to articles_path
  end
  private
  def tryingmethod
    @article = Article.find(params[:id])
  end
  def article_params_access
    params.require(:article).permit(:title,:desc)
  end
end