class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion:{in: %w(Fiction Non-Fiction)}
    validate :is_title_clickbait

    def is_title_clickbait
        if title == "True Facts"
            errors.add(:title, "Clickbait not allowed")
        end
    end
end
