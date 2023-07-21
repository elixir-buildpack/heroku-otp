require 'graphql/client'
require 'graphql/client/http'

module GHAPI
  HTTP = GraphQL::Client::HTTP.new('https://api.github.com/graphql') do
    def headers(context)
      if !ENV['GITHUB_TOKEN'].nil?
        { 'Authorization': "Bearer #{ENV['GITHUB_TOKEN']}" }
      else
        {}
      end
    end
  end

  Schema = if File.exist?("gh-graph.json")
    GraphQL::Client.load_schema("gh-graph.json")
  else
    GraphQL::Client.load_schema(HTTP)
  end

  Client = GraphQL::Client.new(schema: Schema, execute: HTTP)

  GetReleases = Client.parse <<-GRAPHQL
    query($repo_owner: String!, $repo_name: String!, $after: String) {
      repository(name: $repo_name, owner: $repo_owner) {
        releases(orderBy: {field: NAME, direction: DESC}, first: 100, after: $after) {
          totalCount
          nodes {
            tag {
              name
            }
          }
          edges {
            cursor
          }
        }
      }
    }
  GRAPHQL
end
