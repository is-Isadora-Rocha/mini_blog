class Post < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, length: { minimum: 5 }
  validates :description, length: { maximum: 50 }
  #usuário precisa escrever no máximo de 50 caracteres

  before_create do
    self.title =  "#{self.id} - #{self.title}"
  end
end
