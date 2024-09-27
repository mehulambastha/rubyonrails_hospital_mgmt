require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/users' do
    get 'List all users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'Users retrieved' do
        schema type: :array, items: { '$ref' => '#/components/schemas/User' }
        run_test!
      end
    end

    post 'Create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/User' }

      response '201', 'User created' do
        let(:user) { { first_name: 'John', last_name: 'Doe', email: 'john@example.com', phone: '1234567890' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { first_name: 'John' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    get 'Retrieve a user' do
      tags 'Users'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'User retrieved' do
        schema '$ref' => '#/components/schemas/User'
        let(:id) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com').id }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'Update a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :user, in: :body, schema: { '$ref' => '#/components/schemas/User' }

      response '200', 'User updated' do
        let(:id) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com').id }
        let(:user) { { first_name: 'Jane' } }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    delete 'Delete a user' do
      tags 'Users'
      parameter name: :id, in: :path, type: :string

      response '204', 'User deleted' do
        let(:id) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com').id }
        run_test!
      end

      response '404', 'User not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
