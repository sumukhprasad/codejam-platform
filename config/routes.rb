Rails.application.routes.draw do
	devise_for :students, path: 'students', controllers: { 
		confirmations: "students/confirmations",
		mailer: "students/mailer",
		passwords: "students/passwords",
		registrations: "students/registrations",
		sessions: "students/sessions",
		shared: "students/shared",
		unlocks: "students/unlocks"
	}
	devise_for :institutions, path: 'institutions', controllers: { 
		confirmations: "institutions/confirmations",
		mailer: "institutions/mailer",
		passwords: "institutions/passwords",
		registrations: "institutions/registrations",
		sessions: "institutions/sessions",
		shared: "institutions/shared",
		unlocks: "institutions/unlocks"
	}
	
	
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

	# Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
	# Can be used by load balancers and uptime monitors to verify that the app is live.
	get "up" => "rails/health#show", as: :rails_health_check

	# Defines the root path route ("/")
	root :controller => 'index', :action => :index
end