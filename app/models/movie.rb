class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_by_age
    self.actors.order(age: :asc)
  end

  def avg_actor_age
    self.actors.average(:age).round(2)
  end
end
