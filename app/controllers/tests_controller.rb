class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @groups = Group.all
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to @test, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    Score.where(:test_id => @test.id).destroy_all
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def discontinue
    @test_ids = []
    params[:test_classes].each do |group|
      test = Test.new
      test.name = params[:name]
      test.subject_id = params[:subject][:subject_id]
      test.group_id = group.to_i
      test.test_type = params[:btntype]
      test.created_at = DateTime.now
      test.updated_at = DateTime.now
      test.save
      @test_ids << test.id

      @students = Student.where(:class_name => test.group.name)
      @students.each do |student|
        score = Score.new
        score.test_id = test.id
        score.student_id = student.id
        score.save
      end
    end
    #redirect_to tests_path
    redirect_to action: 'edit_results', controller: 'home', test_ids: @test_ids

    #Period.where(week_id:params[:week]).update_all(:state => 0)
    #Period.where(id:params[:period_ids_r]).update_all(:state => 1)
    #Period.where(id:params[:period_ids_a]).update_all(:state => 2)
    #redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:name, :subject_id, :group_id)
    end
end
