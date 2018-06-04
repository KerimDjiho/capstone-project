class StudentInformationsController < ApplicationController
  before_action :set_student_information, only: [:show, :edit, :update, :destroy]

  # GET /student_informations
  # GET /student_informations.json
  def index
    @student_informations = StudentInformation.all
  end

  # GET /student_informations/1
  # GET /student_informations/1.json
  def show
  end

  # GET /student_informations/new
  def new
    @student_information = StudentInformation.new
    @list = CourseChoice.all
  end

  # GET /student_informations/1/edit
  def edit
    @list = CourseChoice.all
  end

  # POST /student_informations
  # POST /student_informations.json
  def create
    @student_information = StudentInformation.new(student_information_params)
    @student_information.course_choice << CourseChoice.find_by_id(params[:student_information][:course_choice_id])
    respond_to do |format|
      if @student_information.save
        format.html { redirect_to @student_information, notice: 'Student information was successfully created.' }
        format.json { render :show, status: :created, location: @student_information }
      else
        format.html { render :new }
        format.json { render json: @student_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_informations/1
  # PATCH/PUT /student_informations/1.json
  def update
    respond_to do |format|
      if @student_information.update(student_information_params)
        format.html { redirect_to @student_information, notice: 'Student information was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_information }
      else
        format.html { render :edit }
        format.json { render json: @student_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_informations/1
  # DELETE /student_informations/1.json
  def destroy
    @student_information.destroy
    respond_to do |format|
      format.html { redirect_to student_informations_url, notice: 'Student information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_information
      @student_information = StudentInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_information_params
            params.require(:student_information).permit(:first_name, :last_name, :dob)

      # params.permit(:first_name, :last_name, :dob, :course_choice_id)
    end
end
