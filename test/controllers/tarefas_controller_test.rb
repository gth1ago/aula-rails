require "test_helper"

class TarefasControllerTest < ActionDispatch::IntegrationTest
  test 'lista todas tarefa' do
    get '/api/tarefas', xhr: true
    assert_response :success
  end

  test 'mostra tarefa' do
    get tarefa_path tarefas(:one), xhr: true
    assert_response :ok
  end

  test 'no exist' do
    assert_raise ActiveRecord::RecordNotFound do
      get '/api/tarefas/111', xhr: true
    end
  end
end
