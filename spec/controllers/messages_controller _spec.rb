require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user){create(:user)}
  let(:group){create(:group)}
  let(:message){create(:message)}

  describe 'GETメソッドのindexアクション' do
    before do
      login_user user
      get :index, params: { group_id: group.id }
    end
    context "ログインしている場合" do
      it "@messageが正しく定義されているか？" do
        blank_message = Message.new
        get :index, params: { group_id: group }
        expect(assigns(:message).attributes).to eq(blank_message.attributes)
      end
      it "@groupが正しく定義されているか？" do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq(group)
      end
      it "該当するビューが描画されているか" do
        expect(response).to render_template :index
      end
      it "@messageインスタンスが生成されているか" do
        expect(assigns(:message)).to be_a_new(Message)
      end
    end

  context "ログインしていない場合" do
    it "サインイン画面にリダイレクトされるか" do
      get :index, params: { group_id: group }
      redirect_to new_user_session_path
    end
  end
end

  describe 'postメソッドのcreateアクション時' do
    context 'ログインしているかつ、メッセージ保存成功' do
      before do
        login_user user
        get :index, params: {group_id: group.id}
      end
      it "データベースにメッセージの保存は出来ているか" do
        expect do
          post :create, params: {group_id: group, message: attributes_for(:message)}
        end.to change(Message, :count).by(1)
      end
      it "正しくindexへリダイレクトしているか？" do
          post :create, params: {group_id: group, message: attributes_for(:message)}
          expect(response).to redirect_to group_messages_path
      end
    end
    context 'ログインしているが、メッセージの保存に失敗した場合' do
      before do
        login_user user
        get :index, params: {group_id: group.id}
      end
      it "メッセージが保存されないこと" do
        expect do
          post :create, params: {group_id: group, message: attributes_for(:message, message: nil, image: nil)}
        end.to change(Message, :count).by(0)
      end
      it "正しくindexへリダイレクトしているか？" do
          post :create, params: {group_id: group, message: attributes_for(:message)}
          expect(response).to redirect_to group_messages_path
      end
    end
    context 'ログインしていない場合' do
      it "ログイン画面にリダイレクトすること" do
          post :create, params: {group_id: group}
          expect(response).to redirect_to new_user_session_path
      end
    end
  end
end