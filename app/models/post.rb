class Post < ApplicationRecord

    after_create :publish_job
    after_update :publish_job

    def publish
        update(published: true, schedule: false)
    end

    private

    def publish_job
        puts "================================="
        if self.publish_at < Time.now
            self.publish
        else
            puts "================================next"
            PostPublishScheduler.perform_at(self.publish_at, self.id)
        end
    end
end
