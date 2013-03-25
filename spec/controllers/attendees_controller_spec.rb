# coding: utf-8
require 'spec_helper'

describe AttendeesController do
  let(:you) { FactoryGirl.create(:user) }

  describe '#attend' do
    context 'ログインしている場合' do
      before do
        # redirect先の設定。 :backで指定しているため
        # HTTP_REFERERがないと落ちる
        @request.env['HTTP_REFERER'] = 'http://test.host/'
      end

      let(:group) { FactoryGirl.create(:group, owner_user_id: you.id, permission: permission) }
      let!(:event) { FactoryGirl.create(:event, group_id: group.id) }

      context 'グループがpublicの場合' do
        let(:permission) { 0 }

        context 'あなたがグループメンバーの場合' do
          before { login_as(you) }
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(+1) }
        end

        context 'あなたがグループメンバーではない場合' do
          let(:other) { FactoryGirl.create(:user) }
          before { login_as(other) }
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param  }.to change(UserEvent, :count).by(+1) }
        end

        context 'あなたがattend済の場合' do
          before do
            User.any_instance.stub(:atnd) { true }
            login_as(you)
          end
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param  }.to change(UserEvent, :count).by(0) }
        end

        context 'あなたがattend済ではない場合' do
          before do
            User.any_instance.stub(:atnd) { false }
            login_as(you)
          end
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param  }.to change(UserEvent, :count).by(+1) }
        end
      end

      context 'グループがpublicではない場合' do
        let(:permission) { 1 }

        context 'あなたがグループメンバーの場合' do
          before { login_as(you) }
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param  }.to change(UserEvent, :count).by(+1) }
        end

        context 'あなたがグループメンバーではない場合' do
          let(:other) { FactoryGirl.create(:user) }
          before { login_as(other) }
          it { expect { put :attend, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(0) }
        end
      end
    end

    context 'ログインしていない場合' do
      let(:group) { FactoryGirl.create(:group, owner_user_id: you.id) }
      let!(:event) { FactoryGirl.create(:event, group_id: group.id) }
      before { bypass_rescue }
      it { expect { put :attend, event_id: event.to_param, group_id: group.to_param }.to raise_error(Authentication::Unauthenticated) }
    end
  end

  describe '#delete' do
    before do
      @request.env['HTTP_REFERER'] = 'http://test.host/'
      login_as(you)
    end

    let(:group) { FactoryGirl.create(:group, owner_user_id: you.id) }
    let(:event) { FactoryGirl.create(:event, group_id: group.id) }
    let!(:user_event) { FactoryGirl.create(:user_event, event_id: event.id, user_id: user_id) }

    context 'あなたがattendしている場合' do
      let(:user_id) { you.id }
      it { expect { put :delete, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(-1) }
    end

    context 'あなたがattendしていない場合' do
      let(:other) { FactoryGirl.create(:user) }
      let(:user_id) { other.id }
      it { expect { put :delete, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(0) }
    end
  end

  describe '#absent' do
    before do
      @request.env['HTTP_REFERER'] = 'http://test.host/'
    end

    let(:group) { FactoryGirl.create(:group, owner_user_id: you.id, permission: 1) }
    let(:event) { FactoryGirl.create(:event, group_id: group.id) }

    context 'あなたがグループメンバーの場合' do
      before { login_as(you) }
      it { expect { put :absent, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(+1) }
    end

    context 'あなたがグループメンバーではない場合' do
      let(:other) { FactoryGirl.create(:user) }
      before do
        login_as(other)
        bypass_rescue
      end
      it { expect{ put :absent, event_id: event.to_param, group_id: group.to_param }.to raise_error(Group::NotGroupMember) }
    end
  end

  describe '#maybe' do
    before do
      @request.env['HTTP_REFERER'] = 'http://test.host/'
    end

    let(:group) { FactoryGirl.create(:group, owner_user_id: you.id, permission: 1) }
    let(:event) { FactoryGirl.create(:event, group_id: group.id) }

    context 'あなたがグループメンバーの場合' do
      before { login_as(you) }
      it { expect{ put :maybe, event_id: event.to_param, group_id: group.to_param }.to change(UserEvent, :count).by(+1) }
    end

    context 'あなたがグループメンバーではない場合' do
      let(:other) { FactoryGirl.create(:user) }
      before do
        login_as(other)
        bypass_rescue
      end
      it { expect{ put :maybe, event_id: event.to_param, group_id: group.to_param }.to raise_error(Group::NotGroupMember) }
    end
  end
end
