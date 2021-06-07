require "test_helper"

class TarefasControllerTest < ActionDispatch::IntegrationTest
  test 'lista todas tarefa' do
    get '/api/tarefas', xhr: true
    assert_response :success
  end

  test 'mostra tarefa' do
    tarefa_path: tarefas(:one)
  end
end
