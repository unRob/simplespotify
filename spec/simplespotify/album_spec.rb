require 'spec_helper'
require 'pp'

data = <<JSON
{
    "album_type": "album",
    "artists": [
        {
            "external_urls": {
                "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
            },
            "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
            "id": "2BTZIqw0ntH9MvilQ3ewNY",
            "name": "Cyndi Lauper",
            "type": "artist",
            "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
        }
    ],
    "available_markets": [],
    "copyrights": [
        {
            "text": "(P) 2000 Sony Music Entertainment Inc.",
            "type": "P"
        }
    ],
    "external_ids": {
        "upc": "5099749994324"
    },
    "external_urls": {
        "spotify": "https://open.spotify.com/album/0sNOF9WDwhWunNAHPD3Baj"
    },
    "genres": [],
    "href": "https://api.spotify.com/v1/albums/0sNOF9WDwhWunNAHPD3Baj",
    "id": "0sNOF9WDwhWunNAHPD3Baj",
    "images": [
        {
            "height": 640,
            "url": "https://i.scdn.co/image/07c323340e03e25a8e5dd5b9a8ec72b69c50089d",
            "width": 640
        },
        {
            "height": 300,
            "url": "https://i.scdn.co/image/8b662d81966a0ec40dc10563807696a8479cd48b",
            "width": 300
        },
        {
            "height": 64,
            "url": "https://i.scdn.co/image/54b3222c8aaa77890d1ac37b3aaaa1fc9ba630ae",
            "width": 64
        }
    ],
    "name": "She's So Unusual",
    "popularity": 4,
    "release_date": "1983",
    "release_date_precision": "year",
    "tracks": {
        "href": "https://api.spotify.com/v1/albums/0sNOF9WDwhWunNAHPD3Baj/tracks?offset=0&limit=50",
        "items": [
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 305560,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/3f9zqUnrnIq0LANhmnaF0V"
                },
                "href": "https://api.spotify.com/v1/tracks/3f9zqUnrnIq0LANhmnaF0V",
                "id": "3f9zqUnrnIq0LANhmnaF0V",
                "name": "Money Changes Everything",
                "preview_url": null,
                "track_number": 1,
                "type": "track",
                "uri": "spotify:track:3f9zqUnrnIq0LANhmnaF0V"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 238266,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/2joHDtKFVDDyWDHnOxZMAX"
                },
                "href": "https://api.spotify.com/v1/tracks/2joHDtKFVDDyWDHnOxZMAX",
                "id": "2joHDtKFVDDyWDHnOxZMAX",
                "name": "Girls Just Want to Have Fun",
                "preview_url": null,
                "track_number": 2,
                "type": "track",
                "uri": "spotify:track:2joHDtKFVDDyWDHnOxZMAX"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 306706,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/6ClztHzretmPHCeiNqR5wD"
                },
                "href": "https://api.spotify.com/v1/tracks/6ClztHzretmPHCeiNqR5wD",
                "id": "6ClztHzretmPHCeiNqR5wD",
                "name": "When You Were Mine",
                "preview_url": null,
                "track_number": 3,
                "type": "track",
                "uri": "spotify:track:6ClztHzretmPHCeiNqR5wD"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 241333,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/2tVHvZK4YYzTloSCBPm2tg"
                },
                "href": "https://api.spotify.com/v1/tracks/2tVHvZK4YYzTloSCBPm2tg",
                "id": "2tVHvZK4YYzTloSCBPm2tg",
                "name": "Time After Time",
                "preview_url": null,
                "track_number": 4,
                "type": "track",
                "uri": "spotify:track:2tVHvZK4YYzTloSCBPm2tg"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 229266,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/6iLhMDtOr52OVXaZdha5M6"
                },
                "href": "https://api.spotify.com/v1/tracks/6iLhMDtOr52OVXaZdha5M6",
                "id": "6iLhMDtOr52OVXaZdha5M6",
                "name": "She Bop",
                "preview_url": null,
                "track_number": 5,
                "type": "track",
                "uri": "spotify:track:6iLhMDtOr52OVXaZdha5M6"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 272840,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/3csiLr2B2wRj4lsExn6jLf"
                },
                "href": "https://api.spotify.com/v1/tracks/3csiLr2B2wRj4lsExn6jLf",
                "id": "3csiLr2B2wRj4lsExn6jLf",
                "name": "All Through the Night",
                "preview_url": null,
                "track_number": 6,
                "type": "track",
                "uri": "spotify:track:3csiLr2B2wRj4lsExn6jLf"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 220333,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/4mRAnuBGYsW4WGbpW0QUkp"
                },
                "href": "https://api.spotify.com/v1/tracks/4mRAnuBGYsW4WGbpW0QUkp",
                "id": "4mRAnuBGYsW4WGbpW0QUkp",
                "name": "Witness",
                "preview_url": null,
                "track_number": 7,
                "type": "track",
                "uri": "spotify:track:4mRAnuBGYsW4WGbpW0QUkp"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 252626,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/3AIeUnffkLQaUaX1pkHyeD"
                },
                "href": "https://api.spotify.com/v1/tracks/3AIeUnffkLQaUaX1pkHyeD",
                "id": "3AIeUnffkLQaUaX1pkHyeD",
                "name": "I'll Kiss You",
                "preview_url": null,
                "track_number": 8,
                "type": "track",
                "uri": "spotify:track:3AIeUnffkLQaUaX1pkHyeD"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 45933,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/53eCpAFNbA9MQNfLilN3CH"
                },
                "href": "https://api.spotify.com/v1/tracks/53eCpAFNbA9MQNfLilN3CH",
                "id": "53eCpAFNbA9MQNfLilN3CH",
                "name": "He's so Unusual",
                "preview_url": null,
                "track_number": 9,
                "type": "track",
                "uri": "spotify:track:53eCpAFNbA9MQNfLilN3CH"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 196373,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/51JS0KXziu9U1T8EBdRTUF"
                },
                "href": "https://api.spotify.com/v1/tracks/51JS0KXziu9U1T8EBdRTUF",
                "id": "51JS0KXziu9U1T8EBdRTUF",
                "name": "Yeah Yeah",
                "preview_url": null,
                "track_number": 10,
                "type": "track",
                "uri": "spotify:track:51JS0KXziu9U1T8EBdRTUF"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 275560,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/2BGJvRarwOa2kiIGpLjIXT"
                },
                "href": "https://api.spotify.com/v1/tracks/2BGJvRarwOa2kiIGpLjIXT",
                "id": "2BGJvRarwOa2kiIGpLjIXT",
                "name": "Money Changes Everything",
                "preview_url": null,
                "track_number": 11,
                "type": "track",
                "uri": "spotify:track:2BGJvRarwOa2kiIGpLjIXT"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 320400,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/5ggatiDTbCIJsUAa7IUP65"
                },
                "href": "https://api.spotify.com/v1/tracks/5ggatiDTbCIJsUAa7IUP65",
                "id": "5ggatiDTbCIJsUAa7IUP65",
                "name": "She Bop - Live",
                "preview_url": null,
                "track_number": 12,
                "type": "track",
                "uri": "spotify:track:5ggatiDTbCIJsUAa7IUP65"
            },
            {
                "artists": [
                    {
                        "external_urls": {
                            "spotify": "https://open.spotify.com/artist/2BTZIqw0ntH9MvilQ3ewNY"
                        },
                        "href": "https://api.spotify.com/v1/artists/2BTZIqw0ntH9MvilQ3ewNY",
                        "id": "2BTZIqw0ntH9MvilQ3ewNY",
                        "name": "Cyndi Lauper",
                        "type": "artist",
                        "uri": "spotify:artist:2BTZIqw0ntH9MvilQ3ewNY"
                    }
                ],
                "available_markets": [],
                "disc_number": 1,
                "duration_ms": 288240,
                "explicit": false,
                "external_urls": {
                    "spotify": "https://open.spotify.com/track/5ZBxoa2kBrBah3qNIV4rm7"
                },
                "href": "https://api.spotify.com/v1/tracks/5ZBxoa2kBrBah3qNIV4rm7",
                "id": "5ZBxoa2kBrBah3qNIV4rm7",
                "name": "All Through The Night - Live",
                "preview_url": null,
                "track_number": 13,
                "type": "track",
                "uri": "spotify:track:5ZBxoa2kBrBah3qNIV4rm7"
            }
        ],
        "limit": 50,
        "next": null,
        "offset": 0,
        "previous": null,
        "total": 13
    },
    "type": "album",
    "uri": "spotify:album:0sNOF9WDwhWunNAHPD3Baj"
}
JSON

describe SimpleSpotify::Model::Album do

  before :all do
    @album = SimpleSpotify::Model::Album.new(JSON.parse(data, symbolize_names: true))
  end

  it 'has an id' do
    expect(@album.id).to eq '0sNOF9WDwhWunNAHPD3Baj'
  end

  it 'should display links correctly' do
    expect(@album.link).to eq 'https://api.spotify.com/v1/albums/0sNOF9WDwhWunNAHPD3Baj'
    expect(@album.link :uri).to eq 'spotify:album:0sNOF9WDwhWunNAHPD3Baj'
    expect(@album.link :web).to eq 'https://open.spotify.com/album/0sNOF9WDwhWunNAHPD3Baj'
  end

  it 'should have an UPC code' do
    expect(@album.upc).to eq '5099749994324'
  end

  after :all do
    # pp @album.to_h
  end
end
