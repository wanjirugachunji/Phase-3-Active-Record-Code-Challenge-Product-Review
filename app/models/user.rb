class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through: :reviews

    def favorite_product
        self.reviews.max_by {|review|review.star_rating}
    end 

    def remove_reviews(product)
        self.reviews.find{|review|review.product_id ==product.id}.delete_all
    end
end