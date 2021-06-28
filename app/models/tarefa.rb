class Tarefa < ApplicationRecord
    validates :name, presence: true, length: {in: 5..50}
    validates :description, presence: true, length: {in: 1..100}
    validates :status, inclusion: [true, false]
    belongs_to :user
end

=begin
author tem varios livro
user tem varias tarefas

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

class Book < ApplicationRecord
  belongs_to :author
end

@book = @author.books.create(published_at: Time.now)
=end