Types::QueryType = GraphQL::ObjectType.define do
  name "Query"


  field :posts, types[Types::PostType] do
    resolve -> (obj, args, ctx) {
      Post.all
    }
  end

  field :users, types[Types::UserType] do
    resolve -> (obj, args, ctx) {
      User.all
    }
  end

  field :comments, types[Types::CommentType] do
    resolve -> (obj, args, ctx) {
      Comment.all
    }
  end

  # field :post, Types::PostType do
  #   argument :id, types.ID
  #   description "id of the post you want details"
  #   resolve -> (obj, args, ctx) {
  #     Post.where(id: args[:id])
  #   }
  # end

  # field :posts, Types::PostType do
  #   argument :user_id, types.ID
  #   description "id of the author you ant to see posts"
  #   resolve -> (obj, args, ctx) {
  #     Post.where(user_id: args[:user_id])
  #   }
  # end

  # field :users, Types::UserType do
  #   argument :id,  types.ID
  #   description "all posts from this user"
  #   resolve -> (obj, args, ctx) {
  #     User.where(id: args[:id])
  #   }
  # end





end
