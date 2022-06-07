module Comments
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with comments (SHOW/ADD) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
        if (verb != "ADD" && verb != "SHOW")
          puts "Illegal input! Try again"
          next
        end
  
        action = nil
  
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  
  
  
  module Resource
    def connection(routes)
      if routes.nil?
        puts "No route matches for #{self}"
        return
      end
  
      loop do
        print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
        verb = gets.chomp
        break if verb == 'q'
        if (verb != "GET" && verb != "POST" && verb != "PUT" && verb != "DELETE")
          puts "Illegal input! Try again"
          next
        end
  
        action = nil
  
        if verb == 'GET'
          print 'Choose action (index/show) / q to exit: '
          action = gets.chomp
          break if action == 'q'
          if (action != "index" && action != "show")
            puts "Illegal input! Try again"
            next
          end
        end
  
        action.nil? ? routes[verb].call : routes[verb][action].call
      end
    end
  end
  
  class CommentsController
    extend Comments
    def initialize
      $comments = []
    end
  
  
  
    def show
  
      if $posts.empty?
        puts "No posts yet! You cant do the first right now"
        return
      end
  
  
  
      puts "Input the id of the post which comments you want to see"
      id = gets.to_i
      if $comments[id-1].empty?
        puts "No comments yet!"
        return
      end
      puts "The post number #{id}: "
      puts $posts[id-1]
      puts "Comments: "
      $comments[id-1].each.with_index do |string, index|
        puts "#{index+1}:     #{string}"
      end
    end
  
  
    def add
      if $posts.empty?
        puts "No posts yet! You cant do the first right now"
        return
      end
      puts "Input the id of the post you want to comment"
      id = gets.to_i
      puts "The post number #{id}: "
      puts $posts[id-1]
      puts "Input your comment: "
      string = gets.chomp
      $comments[id-1].push(string)
      puts "Commenting done!"
    end
  
  end
  
  
  class PostsController
    extend Resource
  
    def initialize
      $posts = []
    end
  
    def index
      if $posts.empty?
        puts "No posts yet! You cant do the first right now"
        return
      end
      $posts.each.with_index do |string, index|
        puts "Index: #{index+1} post: #{string}"
      end
    end
  
    def show
      puts "Input the id of post you want to find: "
      id = gets.to_i
      while !id.integer? do
        puts "Its not a number! Please retry"
        id = gets.to_i
      end
      $posts.each.with_index do |string, index|
        if (index+1).eql?(id)
          puts "Your post is #{string}"
        end
      end
    end
  
    def create
      commentsList = []
      puts "Input the post you want to add: "
      string = gets.chomp
      $posts.push(string)
      $comments.push(commentsList)
      puts "Your post added with the index #{$posts.size}"
    end
  
    def update
      puts "Input the id of post you want to edit: "
      id = gets.to_i
      puts "Input the text you want to edit: "
      str = gets.chomp
      $posts.each.with_index do |string, index|
        if index.eql? id
          string = str
        end
      end
    end
  
    def destroy
      puts "Input the id of post you want to delete: "
      id = gets.to_i
      list = []
      commentsList = []
      $posts.each.with_index do |string, index|
        if index != id-1
          commentsList.push($comments[index])
          list.push(string)
        end
      end
      if list.empty?
        puts 'No string with such id'
      else
        puts 'String successfully deleted!'
        $posts = list
        $comments = commentsList
      end
    end
  end
  
  class Router
    def initialize
      @routes = {}
    end
  
    def init
      resources(PostsController, CommentsController, 'posts')
  
      loop do
        print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
        choise = gets.chomp
  
        PostsController.connection(@routes['posts']) if choise == '1'
        CommentsController.connection(@routes['posts']) if choise == '2'
        break if choise == 'q'
      end
  
      puts 'Good bye!'
    end
  
    def resources(klass1, klass2, keyword)
      postsController = klass1.new
      commentsController = klass2.new
      @routes[keyword] = {
        'SHOW' => commentsController.method(:show),
        'ADD' => commentsController.method(:add),
        'GET' => {
          'index' => postsController.method(:index),
          'show' => postsController.method(:show)
        },
        'POST' => postsController.method(:create),
        'PUT' => postsController.method(:update),
        'DELETE' => postsController.method(:destroy)
      }
    end
  end
  
  router = Router.new
  
  router.init