class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    @character ? (redirect_to user_character_path(@character)) : (redirect_to user_new_character_path)
  end

  def edit
    redirect_to root_path unless current_user.id == @character.show.user_id
  end

  def show #seems a bit pointless.
  end

  def update
    @character.update(character_params)
    @character.valid? ? (redirect_to user_character_path(@character)) : (redirect_to user_edit_character_path)
  end

  def index
    @characters = Character.all
  end

  def destroy
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :show_id, :deceased, :dislike, :note)
  end

end