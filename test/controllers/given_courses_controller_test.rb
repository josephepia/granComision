require 'test_helper'

class GivenCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @given_course = given_courses(:one)
  end

  test "should get index" do
    get given_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_given_course_url
    assert_response :success
  end

  test "should create given_course" do
    assert_difference('GivenCourse.count') do
      post given_courses_url, params: { given_course: { discipleship_id: @given_course.discipleship_id, fechaCierre: @given_course.fechaCierre, fechaInicio: @given_course.fechaInicio, idGrupo: @given_course.idGrupo, teacher_id: @given_course.teacher_id } }
    end

    assert_redirected_to given_course_url(GivenCourse.last)
  end

  test "should show given_course" do
    get given_course_url(@given_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_given_course_url(@given_course)
    assert_response :success
  end

  test "should update given_course" do
    patch given_course_url(@given_course), params: { given_course: { discipleship_id: @given_course.discipleship_id, fechaCierre: @given_course.fechaCierre, fechaInicio: @given_course.fechaInicio, idGrupo: @given_course.idGrupo, teacher_id: @given_course.teacher_id } }
    assert_redirected_to given_course_url(@given_course)
  end

  test "should destroy given_course" do
    assert_difference('GivenCourse.count', -1) do
      delete given_course_url(@given_course)
    end

    assert_redirected_to given_courses_url
  end
end
