class Tweet < ApplicationRecord
  belongs_to :user
  # validate :body, presence: true

  scope :ordered, -> { order(created_at: 'DESC') }

  def as_json(options={})
    super(methods: [:name, :gravatar])
  end

  def name
    user.full_name
  end

  def gravatar
    hash = Digest::MD5.hexdigest(user.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end
end