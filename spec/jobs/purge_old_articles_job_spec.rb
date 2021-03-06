require 'rails_helper'

RSpec.describe PurgeOldArticlesJob, type: :job do
  subject(:job) { described_class.perform_later }
  ActiveJob::Base.queue_adapter = :test

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class).on_queue('default')
  end
  
  it 'executes perform' do
    expect(PurgeOldArticlesJob).to receive(:perform_later)
    PurgeOldArticlesJob.perform_later
  end

end
