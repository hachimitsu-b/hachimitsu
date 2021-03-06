Rails.application.routes.draw do

# #利用者側コントローラー
#   namespace :user do
#     get 'carts/index'
#     get 'carts/new'
#     get 'carts/create'
#     get 'carts/edit'
#     get 'carts/update'
#     get 'carts/history'
#   end

#   namespace :user do
#     get 'cds/show'
#     get 'cds/index'
#   end

#   namespace :user do
#     get 'users/show'
#     get 'users/edit'
#     get 'users/update'
#   end

# #管理者側コントローラー
#     namespace :admin do
#     get 'admins/show'
#   end

#   namespace :admin do
#     get 'cds/index'
#     get 'cds/show'
#     get 'cds/new'
#     get 'cds/create'
#     get 'cds/edit'
#     get 'cds/update'
#   end

#   namespace :admin do
#     get 'users/index'
#     get 'users/show'
#     get 'users/edit'
#     get 'users/update'
#   end

  # devise_for :members あとで実装

  # 管理者側のpath
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
	}

	# ユーザー側のpath
	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}

	# usersディレクトリ内のコントローラーのpath
	# 生成されるpath => ooo_path
	scope module: :users do
		resources :users, only: [:show, :edit, :update, :destroy]
		# 退会手続き
		# post ''
		# 退会完了
		# post ''
		resources :carts, only: [:create, :index, :edit, :update]
		# 支払い方法選択
		# post ''
		resources :cds, only: [:show, :index]
	end


	# adminディレクトリ内のコントローラーのpath
	# 生成されるpath => admin_ooo_path
	namespace :admin do
		resources :users, only: [:index, :show, :edit, :update, :destroy]
		# 購入履歴を表示
		# get ''
		resources :cds
		resources :carts, only: [:index]
		resources :admins, only: [:show]
	end
end
