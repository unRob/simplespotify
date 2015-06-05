module SimpleSpotify
  module Model
    class Album
      include Resource

      prop :type, from: :album_type

      many :artists
      prop :markets
      prop :copyrights

      merge :external_ids

      prop :genres, default: []
      many :images

      prop :name
      prop :popularity
      prop :release_date
      prop :release_date_precision

      many :tracks, paginated: true


    end
  end
end