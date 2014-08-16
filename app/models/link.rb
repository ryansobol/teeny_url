class Link
  include Mongoid::Document

  field :url, type: String

  field :slug, type: String, default: -> do
     (Time.now.to_i + rand(36**8)).to_s(36)
  end

  field :count, type: Integer, default: 0

  include Mongoid::Timestamps::Created

  def to_liquid
    attributes
  end
end
