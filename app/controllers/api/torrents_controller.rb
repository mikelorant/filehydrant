class Api::TorrentsController < ApplicationController
  def index
    hash = {
      key1: :value1,
      key2: :value2
    }

    render json: hash
  end
end
