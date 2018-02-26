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

  # field :allFields, Types::UserType do
  #   resolve -> (obj, args, ctx) {
  #     obj.each do |user|
  #       fields = User.column_names
  #       fields.each do |field|
  #         user.field
  #       end
  #     end
  #   }
  # end

  field :comments, Types::CommentType do
    resolve -> (obj, args, ctx) { obj.comments }
  end

end
