class TarefasController < ApplicationController
  def index
    tarefas = Tarefa.all
    render json: tarefas
  end

  def create
    tarefa = Tarefa.new(permit_params)

    if tarefa.save
      render json: tarefa, status: :created, location: tarefas_path(tarefa)
    else
      render json: tarefa.errors, status: :unprocessable_entity
    end
  end

  def show
    tarefa = Tarefa.find(params[:id])
    render json: tarefa
  end

  def update
    tarefa = Tarefa.find(params[:id])
    if tarefa.update(permit_params || {})
      render json: tarefa
    else
      render json: tarefa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    Tarefa.find(params[:id]).destroy
  end

  private

  def permit_params
    params.require(:tarefa).permit(:name, :description, :status) if params[:tarefa].present?
  end
end
