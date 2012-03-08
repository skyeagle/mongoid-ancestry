require 'rubygems'
require 'bundler/setup'

require 'mongoid'
require 'rspec'

require 'mongoid-ancestry'

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("test")
end

class Post
  include Mongoid::Document
  
  embeds_many :comments
  embeds_many :links
end

class Comment
  include Mongoid::Document
  include Mongoid::Ancestry
  has_ancestry
  embedded_in :post
end

describe Post do
  before(:each) do
    @post = Post.create
    @comment = @post.comments.build
    @comment.save
    @embedded_comment = @post.comments.build
    @embedded_comment.parent = @comment
    @embedded_comment.save
  end

  it "children call should be valid" do
    @comment.children.size.should eq(1)
  end
  
  it "should return parent_id" do
    @embedded_comment.parent_id.should eq(@comment.id)
  end
  
  it "should return parent object" do
    @embedded_comment.parent.should eq(@comment)
  end
  
  it "should return root object" do
    @embedded_comment.root.should eq(@comment)
  end
  
  it "should return root object" do
    @comment.root.should eq(@comment)
  end
  
end
