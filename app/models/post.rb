class Post < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 15 }
  #usuário precisa escrever no minimo 15 caracteres

  before_create do
    self.title =  "#{self.id} - #{self.title}"
  end
end
