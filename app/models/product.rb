class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        self.user << Review.create(star_rating: 3, comment: "it was good!")
    end
    def print_all_reviews
        puts "Review for #{self.name} by #{self.review.user}: #{self.review.star_rating}. #{self.review.comment}"
    end

    def average_rating
        self.reviews.map{|review|review.star_rating}.average
        
    end
end