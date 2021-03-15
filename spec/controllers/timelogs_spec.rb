# frozen_string_literal: true

require 'rails_helper'

describe TimelogsController do
  describe 'GET index' do
    it 'should require the user to be logged in' do
      get :index
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should render the index template' do
        get :index
        expect(response).to render_template('index')
      end
      it 'should assign @current_user' do
        get :index
        expect(assigns(:current_user)).to eq(@user)
      end
      it 'should assign @timelogs' do
        get :index
        expect(assigns(:timelogs)).to include(@timelog.project)
        expect(assigns(:timelogs)[@timelog.project]).to include(@timelog.date)
        expect(assigns(:timelogs)[@timelog.project][@timelog.date]).to include(@timelog)
      end
      it 'should only show timelogs for the logged in user' do
        someone_elses_timelog = create(:timelog)
        get :index
        expect(assigns(:timelogs)).to_not include(someone_elses_timelog)
      end
    end
  end
  describe 'GET show' do
    it 'should require the user to be logged in' do
      timelog = create(:timelog)
      get :show, params: { id: timelog.id }
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should render the show template' do
        get :show, params: { id: @timelog.id }
        expect(response).to render_template('show')
      end
      it 'should assign @current_user' do
        get :show, params: { id: @timelog.id }
        expect(assigns(:current_user)).to eq(@user)
      end
      it 'should assign @timelog' do
        get :show, params: { id: @timelog.id }
        expect(assigns(:timelog)).to eq(@timelog)
      end
      it 'should only show timelogs for the logged in user' do
        someone_elses_timelog = create(:timelog)
        expect do
          get :show, params: { id: someone_elses_timelog.id }
        end.to raise_error(ActionController::RoutingError)
      end
    end
  end
  describe 'GET new' do
    it 'should require the user to be logged in' do
      get :new
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        sign_in @user
      end
      it 'should render the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end
  end
  describe 'GET edit' do
    it 'should require the user to be logged in' do
      timelog = create(:timelog)
      get :edit, params: { id: timelog.id }
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should render the edit template' do
        get :edit, params: { id: @timelog.id }
        expect(response).to render_template('edit')
      end
    end
  end
  describe 'POST create' do
    it 'should require the user to be logged in' do
      post :create
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should create a timelog' do
        timelog_params = nested_attributes_for(:timelog)
        expect { post :create, params: { timelog: timelog_params } }.to change(Timelog, :count).by(1)
      end
      it 'should redirect to the index page' do
        timelog_params = nested_attributes_for(:timelog)
        post :create, params: { timelog: timelog_params }
        expect(subject).to redirect_to(timelogs_path)
      end
      it 'should use the current user when none is given' do
        timelog_params = nested_attributes_for(:timelog)
        timelog_params['user_id'] = nil
        expect { post :create, params: { timelog: timelog_params } }.to change(Timelog, :count).by(1)
        expect(Timelog.last.user).to eq(@user)
      end
    end
  end
  describe 'PATCH update' do
    it 'should require the user to be logged in' do
      timelog = create(:timelog)
      put :update, params: { id: timelog.id, timelog: nested_attributes_for(:timelog) }
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should allow owners of the timelog to update it' do
        attributes = @timelog.attributes
        attributes[:amount] = 20
        put :update, params: { id: @timelog.id, timelog: attributes }
        expect(@timelog.reload.amount).to eq(20)
      end
      it 'should only allow owners of the timelog to update it' do
        other_timelog = create(:timelog)
        attributes = other_timelog.attributes
        attributes[:amount] = 20
        expect do
          put :update, params: { id: other_timelog.id, timelog: attributes }
        end.to raise_error(ActionController::RoutingError)
      end
    end
  end
  describe 'DELETE destroy' do
    it 'should require the user to be logged in' do
      timelog = create(:timelog)
      delete :destroy, params: { id: timelog.id }
      expect(subject).to redirect_to(new_user_session_path)
    end
    describe 'logged in' do
      before(:each) do
        @user = create(:user)
        @timelog = create(:timelog, user: @user)
        sign_in @user
      end
      it 'should allow owners of the timelog to delete it' do
        expect do
          delete :destroy, params: { id: @timelog.id }
        end.to change(Timelog, :count).by(-1)
      end
      it 'should only allow owners of the timelog to update it' do
        other_timelog = create(:timelog)
        expect do
          delete :destroy, params: { id: other_timelog.id }
        end.to raise_error(ActionController::RoutingError)
      end
    end
  end
end
