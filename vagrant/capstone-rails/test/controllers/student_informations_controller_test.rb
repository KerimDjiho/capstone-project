require 'test_helper'

class StudentInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_information = student_informations(:one)
  end

  test "should get index" do
    get student_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_student_information_url
    assert_response :success
  end

  test "should create student_information" do
    assert_difference('StudentInformation.count') do
      post student_informations_url, params: { student_information: { dob: @student_information.dob, first_name: @student_information.first_name, last_name: @student_information.last_name } }
    end

    assert_redirected_to student_information_url(StudentInformation.last)
  end

  test "should show student_information" do
    get student_information_url(@student_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_information_url(@student_information)
    assert_response :success
  end

  test "should update student_information" do
    patch student_information_url(@student_information), params: { student_information: { dob: @student_information.dob, first_name: @student_information.first_name, last_name: @student_information.last_name } }
    assert_redirected_to student_information_url(@student_information)
  end

  test "should destroy student_information" do
    assert_difference('StudentInformation.count', -1) do
      delete student_information_url(@student_information)
    end

    assert_redirected_to student_informations_url
  end
end
