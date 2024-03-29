class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  #callback
  #antes da ação, faça: :set_post somente na ação SHOW, EDIT, UPDATE E DESTROY

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end
  #todos os posts (post.all) fica dentro da variável @posts que é 'chamado' no views -> index.html.erb

  # GET /posts/1 or /posts/1.json
  def show
    #Aqui está sendo chamado o :set_post
    # @post = Post.find(params[:id])
  end
''
  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end

    #também usado no método set_post para ser destruido por ID
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # set_posts é chamado em qualquer um dos métodos acima.

    def set_post
      @post = Post.find(params[:id])
      # criando uma variável que recebe todos os Posts por id
      # será definido automáticamente na URL
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description)
      #está sendo usado no CREATE e UPDATE
      #Define quais dados serão inseridos e atualizados
    end
end
