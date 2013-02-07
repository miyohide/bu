# coding: utf-8

require 'spec_helper'

describe 'routes to the comments' do
  describe 'GET /comments' do
    it 'does not route to /comments by GET' do
      expect(get('/comments')).not_to be_routable
    end
  end
 
  describe 'POST /comments' do
    it 'route to /comments by POST' do
      expect(post('/comments')).to be_routable
    end
    it 'route /comments by POST to the comments controller and create action' do
      expect(post('/comments')).to route_to(controller: 'comments', action: 'create')
    end
  end
  
  describe 'GET /comments/new' do
    pending 'does not route to /comments/new' do
      expect(get('/comments/new')).not_to be_routable
    end
  end
  
  describe 'GET /comments/:id/edit' do
    it 'does not route to /comments/:id/edit' do
      expect(get('/comments/1/edit')).not_to be_routable
    end
  end
  
  describe 'GET /comments/:id' do
    it 'route to /comments/:id' do
      expect(get('/comments/1')).to be_routable
    end
    it 'route /comments/:id to the comments controller and show action' do
      expect(get('/comments/1')).to route_to(controller: 'comments', action: 'show', id: '1')
    end
  end
  
  describe 'PUT /comments/:id' do
    it 'does not route to /comments/:id by put' do
      expect(put('/comments/1')).not_to be_routable
    end
  end
  
  describe 'DELETE /comments/:id' do
    it 'route to /comments/:id by delete' do
      expect(delete('/comments/1')).to be_routable
    end
    it 'route /comments/:id by delete to the comments controller and destroy action' do
      expect(delete('/comments/1')).to route_to(controller: 'comments', action: 'destroy', id: '1')
    end
  end
end

