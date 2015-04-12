class Torrent
  require 'transmission'

  class ::Transmission::Model::Torrent
    def torrents_attributes
      @torrents.map(&:attributes).map(&:symbolize_keys)
    end
  end

  FIELDS = %w(
    activityDate addedDate dateCreated doneDate downloadDir downloadedEver
    downloadLimit downloadLimited error errorString files fileStats
    hashString id name percentDone rateDownload rateUpload recheckProgress
    sizeWhenDone startDate status trackers totalSize torrentFile uploadedEver
    uploadLimit uploadLimited uploadRatio
  )

  def initialize
    Transmission::Config.set Rails.application.secrets.transmission
  end

  def all
    Rails.cache.fetch("all", expires_in: 15.seconds) do
      Transmission::Model::Torrent.all(fields: FIELDS).torrents_attributes
    end
  end

  def find(id)
    Rails.cache.fetch("find_#{id}", expires_in: 1.second) do
      Transmission::Model::Torrent.find(id.to_i, fields: FIELDS).attributes
    end
  end
end
