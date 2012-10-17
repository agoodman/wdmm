Wdmm::Application.routes.draw do

  resources :answers
  
  root to: 'answers#new'
  
end
