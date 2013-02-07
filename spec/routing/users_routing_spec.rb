# coding: utf-8

require 'spec_helper'

describe 'routes to the users' do
  describe 'GET /users' do
    it 'route to /users by GET' do
      expect(get('/users')).to be_routable
    end
    it 'route /users to the users controller and index action' do
      expect(get('/users')).to route_to(controller: 'users', action: 'index')
    end
  end
 
  describe 'POST /users' do
    it 'does not route to /users by POST' do
      expect(post('/users')).not_to be_routable
    end
  end
  
  describe 'GET /users/new' do
    it 'route to /users/new' do
      expect(get('/users/new')).to be_routable
    end
    it 'route /users/new to the users controller and new action' do
      expect(get('/users/new')).to route_to(controller: 'users', action: 'new')
    end
  end
  
  describe 'GET /users/:id/edit' do
    it 'route to /users/:id/edit' do
      expect(get('/users/1/edit')).to be_routable
    end
    it 'route /users/:id/edit to the users controller and edit action' do
      expect(get('/users/1/edit')).to route_to(controller: 'users', action: 'edit', id: '1')
    end
  end
  
  describe 'GET /users/:id' do
    it 'route to /users/:id' do
      expect(get('/users/1')).to be_routable
    end
  end
  
  describe 'PUT /users/:id' do
    it 'route to /users/:id by put' do
      expect(put('/users/1')).to be_routable
    end
    it 'route /users/:id to the users controller and update action' do
      expect(put('/users/1')).to route_to(controller: 'users', action: 'update', id: '1')
    end
  end
  
  describe 'DELETE /users/:id' do
    it 'does not route to /users/:id by delete' do
      expect(delete('/users/1')).not_to be_routable
    end
  end
end

