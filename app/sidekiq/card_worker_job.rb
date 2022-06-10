class CardWorkerJob
  include Sidekiq::Job
  sidekiq_options retry:false

  def perform(user)
    # Do something

    CardMailer.new_card_email(user).deliver
  end
end
