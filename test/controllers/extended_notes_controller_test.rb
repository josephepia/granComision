require 'test_helper'

class ExtendedNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extended_note = extended_notes(:one)
  end

  test "should get index" do
    get extended_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_extended_note_url
    assert_response :success
  end

  test "should create extended_note" do
    assert_difference('ExtendedNote.count') do
      post extended_notes_url, params: { extended_note: { definitiva: @extended_note.definitiva, discipleship_id: @extended_note.discipleship_id, fecha: @extended_note.fecha, idGrupo: @extended_note.idGrupo, student_id: @extended_note.student_id } }
    end

    assert_redirected_to extended_note_url(ExtendedNote.last)
  end

  test "should show extended_note" do
    get extended_note_url(@extended_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_extended_note_url(@extended_note)
    assert_response :success
  end

  test "should update extended_note" do
    patch extended_note_url(@extended_note), params: { extended_note: { definitiva: @extended_note.definitiva, discipleship_id: @extended_note.discipleship_id, fecha: @extended_note.fecha, idGrupo: @extended_note.idGrupo, student_id: @extended_note.student_id } }
    assert_redirected_to extended_note_url(@extended_note)
  end

  test "should destroy extended_note" do
    assert_difference('ExtendedNote.count', -1) do
      delete extended_note_url(@extended_note)
    end

    assert_redirected_to extended_notes_url
  end
end
