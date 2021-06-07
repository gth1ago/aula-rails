class TarefasController < ApplicationController
  def index
    tarefas = Tarefa.all 
    render json: tarefas
  end

  def show
  end

  def update
  end

  def destroy
  end
end
