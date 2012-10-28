Wdmm::Application.routes.draw do

  resources :answers do
    collection { get :word_cloud }
  end
  
  root to: 'answers#new'
  
end
