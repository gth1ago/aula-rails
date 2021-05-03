require 'test_helper'

class TarefaTest < ActiveSupport::TestCase
  def setup
    @t = Tarefa.new(name: 'Lavar a louça', description: 'Antes das 20h', status: false)
  end

  test 'tarefa correta' do
    assert @t.save
  end

  test 'tarefa sem nome' do
    @t.name = nil

    assert_not @t.save
  end

  test 'tarefa sem descrição' do
    @t.description = nil

    assert_not @t.save
  end

  test 'tarefa sem estado' do
    @t.status = nil

    assert_not @t.save
  end

  test 'tarefa com nome pequeno' do
    @t.name = 'aaaa'

    assert_not @t.save
  end

  test 'tarefa com nome grande demais' do
    @t.name = 'a' * 51

    assert_not @t.save
  end

  test 'tarefa com descrição pequena' do
    @t.description = 'a' * 9

    assert_not @t.save
  end

  test 'tarefa com descrição grande demais' do
    @t.description = 'b' * 501

    assert_not @t.save
  end
end
