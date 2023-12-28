class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  before_action :user_confirmation

  def index
    todos = Todo.all
    render json: { status: 'success', data: todos }
  end

  def show
    render json: { status: 'success', data: @todo }
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { status: 'success', data: todo }
    else
      render json: { status: 'error', data: todo.errors }
    end
  end

  def destroy
    @todo.destroy
    render json: { status: 'success', data: @todo , status: 204}
  end

  def update
    if @todo.update(todo_params)
      render json: { status: 'success', data: @todo }
    else
      render json: { status: 'error', data: @todo.errors }
    end
  end

private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title)
  end
end
