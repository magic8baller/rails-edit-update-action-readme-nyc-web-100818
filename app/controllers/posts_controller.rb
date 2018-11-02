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
    @post = Post.new
    @post.title = params[:title]
    @post.description = params[:description]
    @post.save
    redirect_to post_path(@post)
  end

  # add edit and update methods here
  def edit
    @post = Post.find(params[:id])
  end

#raise method will cause the application to pause and print out the params on an error page. You could also see the params if you called puts params.inspect
  def update
  raise params.inspect
end

#parameters are being passed to the update action

#As you can see, the parameters are being passed to the update action. With that in mind, let's implement the functionality needed inside of the update action so that it will take the form data and update the specified record. Let's sketch out a basic flow for what the update action should do:

#Query the database for the Post record that matches the :id passed to the route.

#Store the query in an instance variable.

#Update the values passed from the form (the update method here is the update method supplied by Active Record, not the update method we're creating). T#he update method takes a hash of the attributes for the model as its argument, e.g. `Post.find(1).update(title: "I'm Changed", description: "And here too!")

#Save the changes in the database.

#Redirect the user to the show page so they can see the updated record.

#take advantage of Active Record's update method so that we're not manually assigning each attribute:

def update
  @post = Post.find(params[:id])
  @post.update(title: params[:title], description: params[:description])
  redirect_to post_path(@post)
end
#Now if you go to the edit page and make changes to the title or description form elements, you will see they are changed when the form is submitted. The edit and update functions are working properly!


end
