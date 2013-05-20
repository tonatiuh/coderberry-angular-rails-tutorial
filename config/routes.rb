AngularCast::Application.routes.draw do
  root to: 'home#index'

  scope "api" do
    get "/screencasts(.:format)" => "screencasts#index"
    get "/screencasts/:id(.:format)" => "screencasts#show"
  end
end
