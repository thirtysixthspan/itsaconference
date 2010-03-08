ActionController::Routing::Routes.draw do |map|
  map.resources :presentations

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"


  #this goes first for priority
  map.connect 'theme/:theme_link', :controller=>"theme", :action=>"show"

#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'

  
  map.root :controller=>"front", :action=>"index"

  map.connect 'order/:action', :controller=>"order" 
  map.connect 'proposal/:action', :controller=>"proposal" 
  map.connect 'program', :controller=>"front", :action=>"program"
  map.connect 'contact', :controller=>"front", :action=>"contact"
  map.connect 'venue', :controller=>"front", :action=>"venue"
  map.connect 'sponsorship', :controller=>"front", :action=>"sponsorship"
  map.connect 'call_for_proposals', :controller=>"front", :action=>"call_for_proposals"
  map.connect 'register_to_attend', :controller=>"front", :action=>"register_to_attend"
  map.connect 'error', :controller=>"error"
  map.connect 'acknowledgements', :controller=>"front", :action=>"acknowledgements"
  map.connect 'privacy_policy', :controller=>"front", :action=>"privacy_policy"
  map.connect 'terms_of_use', :controller=>"front", :action=>"terms_of_use"
  
  map.connect 'keynotes', :controller=>"presentation", :action=>"keynotes"
  map.connect 'talks', :controller=>"presentation", :action=>"talks"
  map.connect 'training', :controller=>"presentation", :action=>"training"

  map.connect 'news', :controller=>"front", :action=>"news"
  
  
  map.resources :presentations
  map.resources :ratings
  map.resources :themes
  map.resources :news
  map.resources :items
  map.resources :purchases
  
  
  #map.error '*url',
  #    :controller => 'error',
  #    :action => 'error_404'

end
