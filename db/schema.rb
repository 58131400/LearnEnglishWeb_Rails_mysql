# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_27_134853) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "audio", primary_key: "AudioID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Path", limit: 100, null: false
    t.text "Content", null: false
  end

  create_table "book", primary_key: "BookId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Name", limit: 50, null: false
    t.text "Content", null: false
    t.string "Level", limit: 10, null: false
    t.string "author", limit: 100, null: false
    t.string "PublishingCompany", limit: 100, null: false
    t.string "image"
  end

  create_table "classdb", primary_key: "ClassId", id: :string, limit: 7, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Name", limit: 100, null: false
  end

  create_table "course", primary_key: "course_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.date "start_time", null: false
    t.date "finish_time", null: false
    t.integer "book_id", null: false
    t.string "course_level", limit: 10, null: false
    t.index ["book_id"], name: "book_id"
  end

  create_table "coursemanagement", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "course_id", null: false
    t.string "teacher_id", limit: 10, null: false
    t.date "teachingDay", null: false
    t.index ["course_id"], name: "course_id"
    t.index ["teacher_id"], name: "teacher_id"
  end

  create_table "document", primary_key: "document_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.string "user_id", limit: 10, null: false
    t.index ["user_id"], name: "user_id"
  end

  create_table "exercise", primary_key: "ExerciseID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "Question", null: false
    t.string "level", limit: 100, null: false
  end

  create_table "exercise_part", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "part_id", null: false
    t.index ["exercise_id"], name: "exercise_id"
    t.index ["part_id"], name: "part_id"
  end

  create_table "part", primary_key: "PartId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "typepart_id", null: false
    t.integer "unit_id", null: false
    t.integer "NumberQuestion", null: false
    t.text "Content", null: false
    t.index ["typepart_id"], name: "typepart_id"
    t.index ["unit_id"], name: "UnitID"
  end

  create_table "part_audio", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "part_id", null: false
    t.integer "audio_id", null: false
    t.index ["audio_id"], name: "audio_id"
    t.index ["part_id"], name: "part_id"
  end

  create_table "rightanswer", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "exercise_id", null: false
    t.integer "selection_id", null: false
    t.index ["exercise_id"], name: "exercise_id"
    t.index ["selection_id"], name: "selection_id"
  end

  create_table "role", primary_key: "RoleId", id: :string, limit: 5, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "RoleName", limit: 50, null: false
  end

  create_table "selection", primary_key: "SelectionId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "Content", null: false
    t.integer "exercise_id", null: false
    t.index ["exercise_id"], name: "FK_selection_exercise"
  end

  create_table "student", primary_key: "user_id", id: :string, limit: 10, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "StudentCard", limit: 8, null: false
    t.string "classdb_id", limit: 7, null: false
    t.integer "point", null: false
    t.index ["classdb_id"], name: "class_id"
  end

  create_table "student_course", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "student_id", limit: 10, null: false
    t.integer "course_id", null: false
    t.float "process", null: false
    t.index ["course_id"], name: "book_id"
    t.index ["student_id"], name: "student_id"
  end

  create_table "student_test", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "student_id", limit: 10, null: false
    t.integer "testdb_id", null: false
    t.float "mark", null: false
    t.index ["student_id"], name: "sinhvien_test_ibfk_2"
    t.index ["testdb_id"], name: "testdb_id"
  end

  create_table "studentpart", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "student_id", limit: 10, null: false
    t.integer "part_id", null: false
    t.float "mark", null: false
    t.index ["part_id"], name: "part_id"
    t.index ["student_id"], name: "student_id"
  end

  create_table "teacher", primary_key: "user_id", id: :string, limit: 10, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "DepartmentName", limit: 50, null: false
    t.string "TeacherCard", limit: 8, null: false
  end

  create_table "test_exercise", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "testdb_id", null: false
    t.integer "exercise_id", null: false
    t.index ["exercise_id"], name: "exercise_id"
    t.index ["testdb_id"], name: "testdb_id"
  end

  create_table "testdb", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "startTime", null: false
    t.datetime "finishTime", null: false
    t.text "description", null: false
    t.string "teacher_id", limit: 10, null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "course_id"
    t.index ["teacher_id"], name: "teacher_id"
  end

  create_table "typepart", primary_key: "TypePartId", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "unit", primary_key: "UnitID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Name", limit: 50, null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "BookId"
  end

  create_table "user", primary_key: "UserID", id: :string, limit: 10, default: "", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Name", default: "", null: false
    t.string "Email", default: "", null: false
    t.string "Phone", limit: 10, default: "", null: false
    t.string "username", default: "", null: false
    t.integer "TypeUser", default: 0, null: false
    t.string "password_digest", default: ""
  end

  create_table "userrole", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "UserID", limit: 10, null: false
    t.string "RoleId", limit: 5, null: false
    t.index ["RoleId"], name: "RoleId"
    t.index ["UserID"], name: "UserID"
  end

  create_table "video", primary_key: "video_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.string "user_id", limit: 10, null: false
    t.string "attachment_file_name"
    t.string "attachment_content_type"
    t.integer "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.string "content"
    t.index ["user_id"], name: "user_id"
  end

  create_table "words", primary_key: "WordID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "Name", limit: 20, null: false
    t.string "Type", limit: 50, null: false
    t.string "Translate", limit: 100, null: false
    t.integer "part_id", null: false
    t.integer "audio_id", null: false
    t.index ["audio_id"], name: "audio_id"
    t.index ["part_id"], name: "vocabualary_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "course", "book", primary_key: "BookId", name: "course_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coursemanagement", "course", primary_key: "course_id", name: "coursemanagement_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "coursemanagement", "teacher", primary_key: "user_id", name: "coursemanagement_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "document", "user", primary_key: "UserID", name: "document_ibfk_1"
  add_foreign_key "exercise_part", "exercise", primary_key: "ExerciseID", name: "exercise_part_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "exercise_part", "part", primary_key: "PartId", name: "exercise_part_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "part", "typepart", primary_key: "TypePartId", name: "part_ibfk_2"
  add_foreign_key "part", "unit", primary_key: "UnitID", name: "part_ibfk_1"
  add_foreign_key "part_audio", "audio", primary_key: "AudioID", name: "part_audio_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "part_audio", "part", primary_key: "PartId", name: "part_audio_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rightanswer", "exercise", primary_key: "ExerciseID", name: "rightanswer_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "rightanswer", "selection", primary_key: "SelectionId", name: "rightanswer_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "selection", "exercise", primary_key: "ExerciseID", name: "FK_selection_exercise", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student", "classdb", primary_key: "ClassId", name: "student_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student", "user", primary_key: "UserID", name: "student_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_course", "student", primary_key: "user_id", name: "student_course_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_test", "student", primary_key: "user_id", name: "student_test_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "student_test", "testdb", name: "student_test_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "studentpart", "part", primary_key: "PartId", name: "studentpart_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "studentpart", "student", primary_key: "user_id", name: "studentpart_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "teacher", "user", primary_key: "UserID", name: "teacher_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "test_exercise", "exercise", primary_key: "ExerciseID", name: "test_exercise_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "test_exercise", "testdb", name: "test_exercise_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "testdb", "course", primary_key: "course_id", name: "testdb_ibfk_2"
  add_foreign_key "testdb", "teacher", primary_key: "user_id", name: "testdb_ibfk_1"
  add_foreign_key "unit", "book", primary_key: "BookId", name: "unit_ibfk_1"
  add_foreign_key "userrole", "role", column: "RoleId", primary_key: "RoleId", name: "userrole_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "userrole", "user", column: "UserID", primary_key: "UserID", name: "userrole_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "video", "user", primary_key: "UserID", name: "video_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "words", "audio", primary_key: "AudioID", name: "words_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "words", "part", primary_key: "PartId", name: "words_ibfk_2", on_update: :cascade, on_delete: :cascade
end
