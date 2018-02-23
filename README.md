# Building a simple GraphQL APP with Ruby on Rails

## How to do it for dummies :)

Just some GraphQl easy setup

First of all, let me say you will need to define all your schema, models and controllers, set up the database you will use as expected in a new rails application before anything.

Then:

<b>1)</b>Add the gems:
```
gem 'graphql'
gem 'graphiql-rails'
gem 'graphql-errors'

```

<b>2)</b>install graphql using the command. It will create a folder <b>app/graphql</b>
```rails generate graphql:install
```


<b>3)</b> Access the folder and open /types/mutation_type.rb
Comment the mutation line until you implement some mutations.

<b>4)</b> Go to the types/query_type.rb

Here is where you create your root queries. Root queries are queries you can call directly :

For an example, I have my model Post and i want to query all my posts and see all those names.

the query will be:

```
query {
  posts{
    name
  }
}
```

the query implementation in types/query_type.rb could be:

```
field :posts, types[Types::PostType] do
    resolve -> (obj, args, ctx) {
      Post.all
    }
  end
```


the <b>" types[Types::PostType]"</b> means you are not calling a conventional type as <b>types.String</b>, types.boolean, types.ID or any <b>pre-defined type </b> of GraphQL so you need to tell GraphQL what is this "PostType". If you are using ActiveRecord and PostGreSQL you can connect your model using:

``` rails generate graphql:object Post
```

It will create a post_type.rb object and inside /types/ there,  you can describe your model using fields:
 ``` #post_type.rb

  field :id, types.ID
  field :name, types.String
  field :body, types.String
```

## ---Do this to each model you have in your schema and modify each one !!!---


 If your model reference other model you just need to reference it ot as inside post_type.rb:

```#post_type.rb

field :user, Types::UserType do
    resolve -> (obj, args, ctx) {
      obj.user
    }
  end
  ```


<b>5)</b> Launch your server and open the url

http://yourapp.com/graphiql or http://localhost:3000/graphiql

make some queries to test!

``` #discover how graphql draw your schema :

query {
 __type(name: "Post"){
  name
  kind
  fields {
    type {
    name
      fields {
        name
        type {
          name
        }
      }

    }
    }
  }

}

## fetch some saved data in your database using your queries

query {
  posts{
    name
    id
    user {
      first_name
      last_name
      city
    }
  }
}
```



# TODO: describe using arguments queries

Args is something you pass to your field, if your field is a custom object type as PostType, the args can be the id or any column of your post table
```#query_type.rb

field :users, Types::UserType do
  argument :id , types.ID
  description "see a particular user"
    resolve -> (obj, args, ctx) {
    User.where(id: args[:id]) }
  end
```

#TODO: mutations and subscriptions

.....i am gonna do this, please tell me if you apreciated it
