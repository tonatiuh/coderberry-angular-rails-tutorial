class Screencast < ActiveRecord::Base
  attr_accessible :duration, :link, :published_at, :source, :summary, :title, :video_url
  validates_presence_of :title, :summary, :duration, :link, :published_at, :source, :video_url
  validates_uniqueness_of :video_url
end
