class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy

  validates :title, presence: true, length: { maximum: 20 }
  validates :body, presence: true
  # https://qiita.com/ozackiee/items/17b91e26fad58e147f2e
  # enum solved: (solved: true, unsolved: false)
end
