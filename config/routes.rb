PatientIntake::Application.routes.draw do

  root :to => 'patients#new'

  resources :patients

end
