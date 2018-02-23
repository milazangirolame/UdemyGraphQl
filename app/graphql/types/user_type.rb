Types::UserType = GraphQL::ObjectType.define do
  name "User"


  field :id, !types.ID
  field :first_name, types.String
  field :last_name, types.String
  field :street, types.String
  field :number, types.String
  field :city, types.String
  field :postcode, types.String
  field :country, types.String

  field :comments, Types::CommentType do
    resolve -> (obj, args, ctx) { obj.comments }
  end

end
