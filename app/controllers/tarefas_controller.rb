class TarefasController < ApplicationController
  def index
    tarefas = Tarefa.all 
    render json: tarefas
  end

  def show
    tarefas = Tarefa.find(params[:id])
    render json: tarefas
  end

  def update;
  end

  def destroy;
  end
end
