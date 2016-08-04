# Online mart

This is a project in building an online mart using Ruby on Rails framework. This is not a
complete online mart setup. The primary objective is to learn RoR to build up models and
setup their DB relations.

* Ruby version - 5.0.0

* System brief description : it is simulating online store using Ruby on Rails.

* Models : there are four models configured in this system. There are Users, Products,
           Users' reviews and Shopping Cart. However there is no cart checkout facility
           and billing model.

* Models Relationships :
  User    has_many :reviews, dependent: :destroy
          has_one  :cart
  Product has_many :reviews
          has_many :users, through: :review
          has_many :carts
  Review  belongs_to :user
          belongs_to :product
  Cart    belongs_to :user
          belongs_to :product
