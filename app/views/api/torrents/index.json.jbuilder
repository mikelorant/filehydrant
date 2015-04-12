json.status status @torrents
json.data do
  json.array! @torrents,
              :name,
              :totalSize,
              :addedDate,
              :status,
              :rateDownload,
              :rateUpload,
              :uploadRatio,
              :uploadedEver
end
