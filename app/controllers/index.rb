require 'debugger'
get '/' do
  # Look in app/views/index.erb
  erb :index
end

#### CATEGORIES

get '/categories' do                #index
  @categories = Category.all
  erb :'/categories/index'
end

get '/categories/new' do            #new
  erb :'/categories/new'
end

post '/categories' do 
  category = Category.new(params[:category])
  if category.save           
    redirect to '/categories'
  else
    @errors = category.errors.messages
    erb :'/categories/new'
  end
end

get '/categories/:id' do             #show
  @category = Category.find_by_id(params[:id])
  @category_posts = @category.posts
  erb :'/categories/show'
end

get '/categories/:id/edit' do       #edit
  @category = Category.find_by_id(params[:id])
  erb :'/categories/edit'
end

put '/categories/:id' do            #update
  Category.update_attributes(params)
  erb :'/categories/show'
end

delete '/categories/:id' do         #destroy
  Category.delete(params[:id])
  erb :'/categories/index'
end

#### POSTS

get '/posts' do                #index
  @posts = Post.all
  erb :'/posts/index'
end

get '/posts/new' do            #new
  erb :'/posts/new'
end

post '/posts' do               #create
  post = Post.new(params[:post])
  post.category_id = 
  if post.save           
    redirect to '/posts'
  else
    @errors = post.errors.messages
    erb :'/posts/new'
  end
end

get '/posts/:id' do             #show
  @post = Post.find_by_id(params[:id])
  erb :'/posts/show'
end

get '/posts/:id/edit' do       #edit
  @post = Post.find_by_id(params[:id])
  erb :'/posts/edit'
end

put '/posts/:id' do            #update
  Post.update_attributes(params)
  erb :'/posts/show'
end

delete '/posts/:id' do         #destroy
  Post.delete(params[:id])
  erb :'/posts/index'
end

