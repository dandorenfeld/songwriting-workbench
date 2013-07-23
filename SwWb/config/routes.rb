### Changed WebApp to SwWb
WebApp::Application.routes.draw do

    get "/" => redirect("/home")
    get  "/home"         => "swwb#home",         :as => "home"
    get  "/resources"    => "swwb#resources",    :as => "resources"
    get  "/about"        => "swwb#about",        :as => "about"
    get  "/contact"      => "swwb#contact",      :as => "contact"
    post "/contact_send" => "swwb#contact_send", :as => "contact_send"
    get  "/login"        => "users#login",       :as => "login"
    post "/login"        => "users#login",       :as => "login"
    get  "/login_guest"  => "users#login_guest", :as => "login_guest"
    get  "/logout"       => "users#logout",      :as => "logout"

    resources :songs, :verses

    resources :titles, :only  => [:index, :create, :new, :edit, :update]
    get  "/titles/:id/delete" => "titles#delete", :as => "delete"

    ### Example:
    ###   resources :songs, :only => [:index, :create, :new, :edit, :show,
    ###                               :update, :destroy]

end
