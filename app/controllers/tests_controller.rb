class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def edit
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path, notice: 'Test was successfully created.'
    else
      render new_test_path
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render edit_test_path
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_url
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:name,
    questions_attributes: [:id, :name, answers_attributes: [:id, :name, :is_right ],
    user_results_attributes: [:id, :score]])
  end
end
