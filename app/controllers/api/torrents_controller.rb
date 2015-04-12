class Api::TorrentsController < ApplicationController
  def index
    @torrents = Torrent.new.all
  end

  def show
    @torrent = Torrent.new.find(params[:id])
  end
end
