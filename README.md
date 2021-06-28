# Aula-Rails

Repositório criado para a capacitação interna de Ruby on Rails do PET-Informática

# cod infos
bundle install
rails server // rails s
rails db:migrate
rails roules
rails t

# novo modelo Tarefas 
rails g model Tarefa name:string description:text status:boolean

# gerando foreign_key criando uma referencia d user p tarefas
rails generate migration AddUserRefToTarefas user:references

# adc em Gemfile
gem 'devise'

# instale com bundle e dps
rails generate devise:install

# config em development.rb..
# cria (se n existir) e configura o modelo com device p usuario
rails generate devise user
# e ja define no config/routes.rb para apontar p controlador Devise

# run 
rails db:migrate