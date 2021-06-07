require "test_helper"

class TarefaTest < ActiveSupport::TestCase
  test 'cria tarefa' do
    t = Tarefa.new(name: 'Lavar o carro', description: 'Rapido', status:'false')
    assert t.save
  end

  test 'sem nome' do
    t = Tarefa.new(description: 'Rapido', name:'teste', status:'false')
    assert t.save
  end
  
  test '+ uma' do
    t = Tarefa.new(description: 'Rapido', status:'false')
    t.name = 'newss'
    assert t.save
  end
  
  test '+ uma maior' do
    t = Tarefa.new(description: 'Rapido', status:'false')
    t.name = 'a' * 50
    assert t.save
  end

end
