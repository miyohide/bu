# coding: utf-8

require 'spec_helper'

describe 'routes to the groups/:group_id/posts' do
  describe 'GET /groups/:group_id/posts' do
    it 'route to /groups/:group_id/posts by GET' do
      expect(get('/groups/1/posts')).to be_routable
    end
    it 'route /groups/:group_id/posts by GET to the groups_posts controller and index action' do
      expect(get('/groups/1/posts')).to route_to(controller: 'groups_posts', action: 'index', group_id: '1')
    end
  end
 
  describe 'POST /groups/:group_id/posts' do
    it 'route to /groups/:group_id/posts by POST' do
      expect(post('/groups/1/posts')).to be_routable
    end
    it 'route /groups/:group_id/posts by POST to the groups_posts controller and create action' do
      expect(post('/groups/1/posts')).to route_to(controller: 'groups_posts', action: 'create', group_id: '1')
    end
  end
  
  describe 'GET /groups/:group_id/posts/new' do
    pending 'does not route to /groups/:group_id/posts/new' do
      expect(get('/groups/1/posts/new')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/posts/:id/edit' do
    it 'does not route to /groups/:group_id/posts/:id/edit' do
      expect(get('/groups/1/posts/1/edit')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/posts/:id' do
    pending 'does not route to /groups/:group_id/posts/:id' do
      expect(get('/groups/1/posts/1')).not_to be_routable
    end
  end
  
  describe 'PUT /groups/:group_id/posts/:id' do
    it 'does not route to /groups/:group_id/posts/:id by put' do
      expect(put('/groups/1/posts/1')).not_to be_routable
    end
  end
  
  describe 'DELETE /groups/:group_id/posts/:id' do
    it 'does not route to /groups/:group_id/posts/:id by delete' do
      expect(delete('/groups/1/posts/1')).not_to be_routable
    end
  end
end

