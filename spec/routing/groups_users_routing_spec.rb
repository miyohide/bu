# coding: utf-8

require 'spec_helper'

describe 'routes to the groups/:group_id/users' do
  describe 'GET /groups/:group_id/users' do
    it 'route to /groups/:group_id/users by GET' do
      expect(get('/groups/1/users')).to be_routable
    end
    it 'route /groups/:group_id/users by GET to the groups_users controller and index action' do
      expect(get('/groups/1/users')).to route_to(controller: 'groups_users', action: 'index', group_id: '1')
    end
  end
 
  describe 'POST /groups/:group_id/users' do
    it 'route to /groups/:group_id/users by POST' do
      expect(post('/groups/1/users')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/users/new' do
    pending 'does not route to /groups/:group_id/users/new' do
      expect(get('/groups/1/users/new')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/users/:id/edit' do
    it 'does not route to /groups/:group_id/users/:id/edit' do
      expect(get('/groups/1/users/1/edit')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/users/:id' do
    it 'route to /groups/:group_id/users/:id' do
      expect(get('/groups/1/users/1')).to be_routable
    end
    it 'route /groups/:group_id/users/1 by GET to the groups_users controller and show action' do
      expect(get('/groups/1/users/1')).to route_to(controller: 'groups_users', action: 'show', group_id: '1', id: '1')
    end
  end
  
  describe 'PUT /groups/:group_id/users/:id' do
    it 'does not route to /groups/:group_id/users/:id by put' do
      expect(put('/groups/1/users/1')).not_to be_routable
    end
  end
  
  describe 'DELETE /groups/:group_id/users/:id' do
    it 'does not route to /groups/:group_id/users/:id by delete' do
      expect(delete('/groups/1/users/1')).not_to be_routable
    end
  end
end

