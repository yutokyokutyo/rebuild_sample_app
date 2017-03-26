Rails.application.routes.draw do
  get 'foo/bar'

  get 'foo/baz'

  get 'static_pages/home'
  get 'static_pages/help'
  root 'application#hello'
end
