# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_13_183733) do
  create_table "forks", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "parent"
    t.string "author"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_forks_on_author"
    t.index ["created_at"], name: "index_forks_on_created_at"
    t.index ["parent"], name: "index_forks_on_parent"
    t.index ["updated_at"], name: "index_forks_on_updated_at"
  end

  create_table "issues", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.boolean "locked"
    t.string "title"
    t.boolean "closed"
    t.datetime "closed_at"
    t.string "url"
    t.string "state"
    t.integer "number"
    t.string "author"
    t.string "author_association"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_issues_on_author"
    t.index ["created_at"], name: "index_issues_on_created_at"
    t.index ["updated_at"], name: "index_issues_on_updated_at"
  end

  create_table "pull_requests", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.boolean "locked"
    t.string "title"
    t.boolean "closed"
    t.datetime "closed_at"
    t.string "state"
    t.integer "number"
    t.string "author"
    t.string "author_association"
    t.boolean "is_draft"
    t.integer "additions", default: 0
    t.integer "deletions", default: 0
    t.datetime "merged_at"
    t.string "merged_by"
    t.integer "changed_files", default: 0
    t.boolean "merged"
    t.integer "comments_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author"], name: "index_pull_requests_on_author"
    t.index ["created_at"], name: "index_pull_requests_on_created_at"
    t.index ["updated_at"], name: "index_pull_requests_on_updated_at"
  end

  create_table "repos", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.string "owner"
    t.string "license"
    t.string "language"
    t.text "description"
    t.boolean "is_fork"
    t.bigint "parent_id"
    t.integer "fork_count"
    t.integer "stargazer_count"
    t.datetime "pushed_at"
    t.json "topics"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_issue_cursor"
    t.string "last_star_cursor"
    t.string "last_pr_cursor"
    t.string "last_fork_cursor"
  end

  create_table "stars", id: false, charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "repo_id"
    t.bigint "user_id"
    t.string "login"
    t.string "location"
    t.string "company"
    t.datetime "starred_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["repo_id", "user_id"], name: "index_stars_on_repo_id_and_user_id", unique: true
  end

  create_table "test_tables", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
