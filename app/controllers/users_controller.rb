class UsersController < ApplicationController
   
   def show
    @nickname = current_user.nickname
    @email = current_user.email
    @sex_id = current_user.sex.name
    @alcohol_ranks = current_user.schedules.group(:alcohol_id).order('count(alcohol_id) desc').limit(2)
   end

end
