Types::QueryType = GraphQL::ObjectType.define do
  name "Query"


  field :posts, Types::PostType do
    resolve -> (obj, args, ctx) {
      Post.all
    }
  end

  field :post, Types::PostType do
    argument :id, types.ID
    description "id of the post you want details"
    resolve -> (obj, args, ctx) {
      Post.where(id: args[:id])
    }
  end

  field :posts, Types::PostType do
    argument :user_id, types.ID
    description "id of the author you ant to see posts"
    resolve -> (obj, args, ctx) {
      Post.where(user_id: args[:user_id])
    }
  end

  field :user, Types::UserType do
    argument :posts, types.ID
    description "all posts from this user"
    resolve -> (obj, args, ctx) {
      obj.posts.each do |post|
        post.name
        post.body
        post.comments
      end

    }
  end





end
