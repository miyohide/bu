# coding: utf-8

require 'spec_helper'

describe 'routes to the user_groups' do
  describe 'GET /user_groups' do
    it 'does not route to /user_groups by GET' do
      expect(get('/user_groups')).not_to be_routable
    end
  end
 
  describe 'POST /user_groups' do
    it 'does not route to /user_groups by POST' do
      expect(post('/user_groups')).not_to be_routable
    end
  end
  
  describe 'GET /user_groups/new' do
    it 'does not route to /user_groups/new' do
      expect(get('/user_groups')).not_to be_routable
    end
  end
  
  describe 'GET /user_groups/:id/edit' do
    it 'does not route to /user_groups/:id/edit' do
      expect(get('/user_groups/1/edit')).not_to be_routable
    end
  end
  
  describe 'GET /user_groups/:id' do
    it 'does not route to /user_groups/:id' do
      expect(get('/user_groups/1')).not_to be_routable
    end
  end
  
  describe 'PUT /user_groups/:id' do
    it 'route to /user_groups/:id by put' do
      expect(put('/user_groups/1')).to be_routable
    end
    it 'route /user_groups/:id by put to the user_groups controller and update action' do
      expect(put('/user_groups/1')).to route_to(controller: 'user_groups', action: 'update', id: '1')
    end
  end
  
  describe 'DELETE /user_groups/:id' do
    it 'route to /user_groups/:id by delete' do
      expect(delete('/user_groups/1')).to be_routable
    end
    it 'route /user_groups/:id by delete to the user_groups controller and destroy action' do
      expect(delete('/user_groups/1')).to route_to(controller: 'user_groups', action: 'destroy', id: '1')
    end
  end
end

