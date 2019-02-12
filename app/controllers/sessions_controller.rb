class SessionsController < ApplicationController
  def create
    # 送られてきたuser nameで登録があればuserに入る。登録がなければnilが入る
    user = User.find_by(name: params[:sessions][:name])
    # authenticateはmodelにhas_secure_passwordを設定したことにしようできるメソッド
    # authenticateはユーザー名とパスワードがマッチしているか確認している
    # つまり、find_byで取得したユーザーのパスワードがparams[:session][:password]が同じであるかを検証している
    if user && user.authenticate(params[:session][:password]) #実際に認証が行われる行
      session[:user_id] = user.id
      redirect_to mypage_path
    else # 認証失敗の処理
      render 'home/index'
    end
  end

  def destroy
    # sessionからuser_idを削除するためにdeleteメソッドを使用
    session.delete(:user_id)
    redirect_to root_path
  end
end
