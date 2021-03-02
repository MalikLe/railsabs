class HomeController < ApplicationController
  def index
  end

  def about
  end


  def select
  	@groups = Group.all
  end

  def timetable

  	@current_week = Week.where("start_date <= :today AND end_date > :today", {today: DateTime.current.to_date}).first
    @current_day = (DateTime.current.to_date - @current_week.start_date).to_i + 1
  	if(params.has_key?(:class))
      gr = params[:class]
      @requested_class = Group.where(id:gr).first
      @students = Student.where(class_name:@requested_class.name)
    else
      #@students = Student.all.order('last_name')
      gr = Group.first.name
      @requested_class = Group.first
      @students = Student.where(class_name:@requested_class.name)
    end


    if(params.has_key?(:week))
      wk = params[:week]
      @requested_week = Week.where(id:wk).first

    else
      @requested_week = @current_week
    end

    if(params.has_key?(:day))
      dy = params[:day]
      @requested_day = dy.to_i

    else
      @requested_day = @current_day
    end

    #@periods = Period.where("week_id = :week AND (student_id IN :student)", {week: wk, student: @students.ids})
    @periods = Period.where(:week_id => wk).where(:day => @requested_day).where(:student_id => @students.ids)
  	
  	
  end

  
end
