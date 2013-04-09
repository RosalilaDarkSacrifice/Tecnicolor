Tecnicolor::Application.routes.draw do
  resources :transferencia_interna_productos

  resources :salida_producto_mal_estados

  resources :productos

  resources :entrada_productos

  resources :categoria

  resources :producto_factura_creditos

  resources :producto_factura_tarjeta

  resources :producto_factura_cheques

  resources :producto_factura_efectivos

  resources :pago_cheques

  resources :pago_tarjeta

  resources :pago_efectivos

  resources :cliente_creditos

  resources :proveedors

  resources :marcas

  get "sessions/new"

  get "users/new"

  resources :factura_creditos

  resources :factura_tarjeta

  resources :factura_cheques

  resources :factura_efectivos


  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "sessions#new"
  resources :users
  resources :sessions

  match ':id/pago_efectivo' => 'pago_efectivos#new', :as => :pagar_efectivo
  match ':id/pago_tarjeta' => 'pago_tarjeta#new', :as => :pagar_tarjeta
  match ':id/pago_cheque' => 'pago_cheques#new', :as => :pagar_cheque

  match "agregarProductoCheque" => "factura_cheques#agregarProductoCheque", :as => "agregarProductoCheque"
  match "agregarProductoCredito" => "factura_creditos#agregarProductoCredito", :as => "agregarProductoCredito"
  match "agregarProductoEfectivo" => "factura_efectivos#agregarProductoEfectivo", :as => "agregarProductoEfectivo"
  match "agregarProductoTarjetum" => "factura_tarjeta#agregarProductoTarjetum", :as => "agregarProductoTarjetum"

  post "buscar_producto_entrada" => "entrada_productos#buscar_producto_entrada", :as => :buscar_producto_entrada

  get "/arqueo" => "reportes#arqueo", :as => "arqueo"
  get "/consultar_factura" => "reportes#consultar_factura", :as => "consultar_factura"
  get "/consultar_factura_por_rango" => "reportes#consultar_factura_por_rango", :as => "consultar_factura_por_rango"
  get "/consultar_factura_por_rango_resumido" => "reportes#consultar_factura_por_rango_resumido", :as => "consultar_factura_por_rango_resumido"
  get "/cuentas_por_cobrar" => "reportes#cuentas_por_cobrar", :as => "cuentas_por_cobrar"
  get "/reporte_galones" => "reportes#reporte_galones", :as => "reporte_galones"
  get "/reporte_unitario" => "reportes#reporte_unitario", :as => "reporte_unitario"
  get "/todos_los_productos" => "reportes#todos_los_productos", :as => "todos_los_productos"

  post "buscar_factura" => "reportes#buscar_factura", :as => :buscar_factura
  post "buscar_factura_por_rango" => "reportes#buscar_factura_por_rango", :as => :buscar_factura_por_rango
  post "buscar_factura_por_rango_resumido" => "reportes#buscar_factura_por_rango_resumido", :as => :buscar_factura_por_rango_resumido

  post "buscar_producto_transferencia" => "transferencia_interna_productos#buscar_producto_transferencia", :as => :buscar_producto_transferencia
  post "buscar_producto_salida" => "salida_producto_mal_estados#buscar_producto_salida", :as => :buscar_producto_salida

	post "buscar_producto_inventario" => "productos#buscar_producto_inventario", :as => :buscar_producto_inventario
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
