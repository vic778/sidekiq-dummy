require 'sidekiq-scheduler'

class PostPublishScheduler
  include Sidekiq::Worker

  def perform(post_id)
    posts = Post.where('publish_at < ?', Time.now)
                .where(published: false)
                .where(schedule: true)        
    posts.each do |post|
      post.publish
    end
    post = Post.find(post_id)
    post.publish
  end
end
