# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170914135104) do

  create_table "albums", force: :cascade do |t|
    t.string "title", null: false
    t.integer "released", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.integer "user_id"
    t.integer "genre_id"
    t.string "cover", default: "https://riversideband.pl/images/rs/covers/nocover.jpg"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
    t.index ["genre_id"], name: "index_albums_on_genre_id"
    t.index ["user_id"], name: "index_albums_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "artist_info"
    t.index ["user_id"], name: "index_artists_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_favorites_on_track_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_genres_on_user_id"
  end

  create_table "playlist_tracks", force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playlist_id"], name: "index_playlist_tracks_on_playlist_id"
    t.index ["track_id"], name: "index_playlist_tracks_on_track_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name", null: false
    t.string "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.integer "genre_id"
    t.integer "album_id"
    t.integer "user_id"
    t.string "link"
    t.index ["album_id"], name: "index_tracks_on_album_id"
    t.index ["artist_id"], name: "index_tracks_on_artist_id"
    t.index ["genre_id"], name: "index_tracks_on_genre_id"
    t.index ["user_id"], name: "index_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "remember_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
