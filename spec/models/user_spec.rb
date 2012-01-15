# coding: UTF-8

require 'spec_helper'

describe User do
   describe "を登録するとき" do
      it "空欄のためにバリデーションに失敗すること" do
         @user = User.new(:name => "")
         @user.should_not be_valid
      end

      it "長さが長すぎるためにバリデーションに失敗すること" do
         @user = User.new(:name => "12345678901234567")
         @user.should_not be_valid
      end

      it "名前が入力されてあって、長さが適切であれば登録できること" do
         @user = User.new(:name => "1234567890123456")
         @user.should be_valid
      end

   end

   describe "権限をチェックするときに" do
      fixtures :users
      it "adminはtrueが返ること" do
         @user = users(:admin)
         @user.administrator?.should be_true
      end

      it "adminでなければfalseが返ること" do
         @user = users(:user1)
         @user.administrator?.should be_false
      end

   end

   describe "statusの確認をするとき" do
      it "常にnewが返ること" do
         @user = User.new
         @user.status.should == "new"
      end


   end



end
