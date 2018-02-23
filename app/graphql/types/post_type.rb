Types::PostType = GraphQL::ObjectType.define do
  name "Post"

  field :id, types.ID
  field :name, types.String
  field :body, types.String

  field :user, Types::UserType do
    resolve -> (obj, args, ctx) { obj.user }
  end

  field :comments, Types::CommentType do
    resolve -> (obj, args, ctx) { obj.comments }
  end

end
