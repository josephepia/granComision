class GivenCoursesController < ApplicationController
  before_action :set_given_course, only: [:show, :edit, :update, :destroy]

  # GET /given_courses
  # GET /given_courses.json
  def index
    @given_courses = GivenCourse.all
  end

  # GET /given_courses/1
  # GET /given_courses/1.json
  def show
  end

  # GET /given_courses/new
  def new
    @given_course = GivenCourse.new
  end

  # GET /given_courses/1/edit
  def edit
  end

  # POST /given_courses
  # POST /given_courses.json
  def create
    @given_course = GivenCourse.new(given_course_params)

    respond_to do |format|
      if @given_course.save
        format.html { redirect_to @given_course, notice: 'Given course was successfully created.' }
        format.json { render :show, status: :created, location: @given_course }
      else
        format.html { render :new }
        format.json { render json: @given_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /given_courses/1
  # PATCH/PUT /given_courses/1.json
  def update
    respond_to do |format|
      if @given_course.update(given_course_params)
        format.html { redirect_to @given_course, notice: 'Given course was successfully updated.' }
        format.json { render :show, status: :ok, location: @given_course }
      else
        format.html { render :edit }
        format.json { render json: @given_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /given_courses/1
  # DELETE /given_courses/1.json
  def destroy
    @given_course.destroy
    respond_to do |format|
      format.html { redirect_to given_courses_url, notice: 'Given course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_given_course
      @given_course = GivenCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def given_course_params
      params.require(:given_course).permit(:idGrupo, :fechaInicio, :fechaCierre, :discipleship_id, :teacher_id)
    end
end
