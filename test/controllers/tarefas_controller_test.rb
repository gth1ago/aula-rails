require 'test_helper'

class TarefasControllerTest < ActionDispatch::IntegrationTest
  test 'lista tarefas' do
    get '/api/tarefas'

    assert_response :success
  end

  test 'criar uma nova tarefa' do
    post '/api/tarefas', xhr: true, params: {
      tarefa: {
        name: 'Lavar o carro',
        description: 'usar lavadora de pressão',
        status: false
      }
    }

    assert_response :created
  end

  test 'criar tarefa com erro de validação' do
    post '/api/tarefas', xhr: true, params: {
      tarefa: {
        description: 'usar lavadora de pressão',
        status: false
      }
    }

    assert_response :unprocessable_entity
  end

  test 'mostra uma tarefa' do
    get tarefas_path tarefas(:um)

    assert_response :ok
  end

  test 'mostra uma tarefa inexistente' do
    assert_raise ActiveRecord::RecordNotFound do
      get '/api/tarefas/162'
    end
  end

  test 'atualiza uma tarefa' do
    put tarefa_path tarefas(:um), xhr: true, params: {
      tarefa: {
        name: 'Mudar o sofá de lugar',
        description: 'Até o fim de semana',
        status: true
      }
    }

    assert_response :ok
  end

  test 'atualiza uma tarefa parcialmente' do
    patch tarefa_path tarefas(:um), xhr: true, params: {
      tarefa: {
        status: true
      }
    }

    assert_response :ok
  end

  test 'atualiza uma tarefa inexistente' do
    assert_raise ActiveRecord::RecordNotFound do
      put '/api/tarefas/162', xhr: true, params: {
        tarefa: {
          name: 'Mudar o sofá de lugar',
          description: 'Até o fim de semana',
          status: true
        }
      }
    end

    assert_raise ActiveRecord::RecordNotFound do
      patch '/api/tarefas/162', xhr: true, params: {
        tarefa: {
          status: true
        }
      }
    end
  end

  test 'atualiza uma tarefa com erros de validação' do
    put tarefa_path tarefas(:um), xhr: true, params: {
      tarefa: {
        name: '',
        description: 'Até o fim de semana',
        status: true
      }
    }

    assert_response :unprocessable_entity
  end

  test 'atualiza uma tarefa parcialmente com erros de validação' do
    put tarefa_path tarefas(:um), xhr: true, params: {
      tarefa: {
        name: ''
      }
    }

    assert_response :unprocessable_entity
  end

  test 'remove uma tarefa' do
    delete tarefa_path tarefas(:um), xhr: true

    assert_response :no_content
  end

  test 'remove uma tarefa inexistente' do
    assert_raise ActiveRecord::RecordNotFound do
      delete '/api/tarefas/162', xhr: true
    end
  end
end
