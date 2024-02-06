class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    JobItem.create!(name: 'name02', user_id: "1")
  end
end
