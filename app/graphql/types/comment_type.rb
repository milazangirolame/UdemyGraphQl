Types::CommentType = GraphQL::ObjectType.define do
  name "Comment"

  field :id, !types.ID


  field :user, Types::UserType do
    resolve -> (obj, args, ctx) { obj.user }
  end

  field :post, Types::PostType do
    resolve -> (obj, args, ctx) { obj.post }
  end
end
