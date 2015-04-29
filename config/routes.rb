FBFalcons::Application.routes.draw do

  root :to => 'main#index'
  
  namespace :admin do
    resources :season_teams
  end


  #Main
  get "main/index"

  #Games
  get "games/seasons"
  match "games/season_result/:id" => "games#season_result"
  match "games/game_result/:id" => "games#game_result"

  #Players
  get "players/index"
  match "players/detail/:id" => "players#detail"

  #Stats
  get "stats/index"


  #Admin 
  namespace :admin do
    get "authentication/login"
    post "authentication/auth"
    get "authentication/logout"
    get "menu/index"
    resources :games
    match "games/season/:season_id/new" => "games#new"
    resources :game_rosters
    resources :season_rosters
    resources :team_members
    resources :members
    resources :teams
    resources :divisions
    resources :seasons
    resources :positions
    resources :prefectures
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
