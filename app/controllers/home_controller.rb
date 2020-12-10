class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user_movie_queues = current_user.movie_queues.order(created_at: :desc) if current_user.present?
    
    sql = 'SELECT *
          FROM `movies`
          WHERE `movies`.`movie_type` IN ( SELECT `movie_type` 
                                            FROM 
                                            (SELECT `movie_type`, COUNT(*)
                                              FROM `orders`, `movies`
                                              WHERE `orders`.`user_id` = '+String(current_user.id) + 
                                              ' AND `orders`.`movie_id` = `movies`.`id`
                                              GROUP BY `movies`.`movie_type` 
                                              LIMIT 1
                                            ) as tmp 
                                          )
          AND `movies`.`id` NOT IN (SELECT `orders`.`movie_id` FROM `orders` WHERE `orders`.`user_id` = '+String(current_user.id)+ ') 
            ORDER BY movies.rating DESC 
            LIMIT 5'
 
    @recommend_movies = ActiveRecord::Base.connection.exec_query(sql)
  end
end
