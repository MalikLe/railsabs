class HomeController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:login_students, :index]
  def index
  end

  def about
  end


  def select
  	@groups = Group.all
  end

  def timetable

  	@current_week = Week.where("start_date <= :today AND end_date >= :today", {today: DateTime.current.to_date}).first
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
      wk = @current_week.id
      @requested_week = @current_week
    end

    if(params.has_key?(:day))
      dy = params[:day].to_i
      if(dy >= 6)
        dy = 5
      end
      @requested_day = dy

    else
      if(@current_day >= 6)
        @requested_day = 1
      else
        @requested_day = @current_day
      end
    end

    #@periods = Period.where("week_id = :week AND (student_id IN :student)", {week: wk, student: @students.ids})
    @periods = Period.where(:week_id => wk).where(:day => @requested_day).where(:student_id => @students.ids)
  	
  	
  end

  def resulttable

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


    if(params.has_key?(:sub))
      sb = params[:sub]
      @requested_subject = Week.where(id:wk).first

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

  def new_test
    @groups = Group.all

  end

  def edit_results
    ts = params[:test_ids].map(&:to_i)
    @requested_tests = Test.where(id:ts)

    if(params.has_key?(:class))
      @gr = params[:class]

    else
      @gr = @requested_tests.first.group_id
    end

    #@students = Student.where(class_name: Group.where(:id => @gr).first.name)
    @requested_test = @requested_tests.where(:group_id => @gr)
    @requested_scores = Score.where(:test_id => @requested_test.ids)
  end

  def show_results
    @groups = Group.all
    if(params.has_key?(:class))
      @gr = params[:class]
    else
      @gr = Group.first.id
    end

    @tests = Test.where(:group_id => @gr)
    @subjects = @tests.distinct.pluck(:subject_id)
    @students = Student.where(:class_name => Group.find(@gr).name)
  end

  def login_students
    @weeks = Week.all
    if(params.has_key?(:mat))
      @mat = params[:mat]
    end

    @periods = Period.where(:student_id => Student.where(:serial_num => @mat).ids).where("state > 0")
    @weeks = Week.all
    #@agg_periods = @periods.group(['week_id', 'id'])
    @agg_periods_abs= @periods.where(:state => 2).group('week_id').count
    @agg_periods_ret= @periods.where(:state => 1).group('week_id').count
    @tot_abs = @periods.where(:state => 2).count
    @tot_ret = @periods.where(:state => 1).count
  end

  def index_teachers
  end
  
end
