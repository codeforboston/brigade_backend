Rails.application.routes.draw do
  mount BrigadeBackend::Engine => "/brigade_backend"
end
