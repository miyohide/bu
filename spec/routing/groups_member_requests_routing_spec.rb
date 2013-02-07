# coding: utf-8

require 'spec_helper'

describe 'routes to the groups/:group_id/member_requests' do
  describe 'GET /groups/:group_id/member_requests' do
    it 'route to /groups/:group_id/member_requests by GET' do
      expect(get('/groups/1/member_requests')).to be_routable
    end
    it 'route /groups/:group_id/member_requests by GET to the groups_member_requests controller and index action' do
      expect(get('/groups/1/member_requests')).to route_to(controller: 'groups_member_requests', action: 'index', group_id: '1')
    end
  end
 
  describe 'POST /groups/:group_id/member_requests' do
    it 'route to /groups/:group_id/member_requests by POST' do
      expect(post('/groups/1/member_requests')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/member_requests/new' do
    it 'does not route to /groups/:group_id/member_requests/new' do
      expect(get('/groups/1/member_requests/new')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/member_requests/:id/edit' do
    it 'does not route to /groups/:group_id/member_requests/:id/edit' do
      expect(get('/groups/1/member_requests/1/edit')).not_to be_routable
    end
  end
  
  describe 'GET /groups/:group_id/member_requests/:id' do
    it 'does not route to /groups/:group_id/member_requests/:id' do
      expect(get('/groups/1/member_requests/1')).not_to be_routable
    end
  end
  
  describe 'PUT /groups/:group_id/member_requests/:id' do
    it 'does not route to /groups/:group_id/member_requests/:id by put' do
      expect(put('/groups/1/member_requests/1')).not_to be_routable
    end
  end
  
  describe 'DELETE /groups/:group_id/member_requests/:id' do
    it 'does not route to /groups/:group_id/member_requests/:id by delete' do
      expect(delete('/groups/1/member_requests/1')).not_to be_routable
    end
  end
end

