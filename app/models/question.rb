class Question < ActiveRecord::Base

  validates :email, presence: true

  def as_json(options)
    super(options.merge(methods: [:gravatar_url]))
  end

  def gravatar_url
    Gravatar.new(email).image_url if email
  end

end
