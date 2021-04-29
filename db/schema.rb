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

ActiveRecord::Schema.define(version: 20210429115813) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "feature_request_id"
    t.integer "activity"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.integer "bucket_id"
    t.integer "feature_request_assignee_id"
    t.integer "tag_id"
    t.bigint "child_id"
    t.date "etc_date"
    t.index ["bucket_id", "organization_id"], name: "index_activities_on_bucket_id_and_organization_id"
    t.index ["child_id"], name: "index_activities_on_child_id"
    t.index ["feature_request_assignee_id"], name: "index_activities_on_feature_request_assignee_id"
    t.index ["tag_id"], name: "index_activities_on_tag_id"
    t.index ["user_id", "feature_request_id"], name: "index_activities_on_user_id_and_feature_request_id"
  end

  create_table "authorizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "provider"
    t.integer "user_id"
    t.integer "organization_id"
    t.text "credentials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qualifier"
    t.string "provider_user_id"
    t.text "information"
    t.text "rules"
    t.index ["organization_id"], name: "index_authorizations_on_organization_id"
    t.index ["provider"], name: "index_authorizations_on_provider"
    t.index ["provider_user_id"], name: "index_authorizations_on_provider_user_id"
    t.index ["user_id"], name: "index_authorizations_on_user_id"
  end

  create_table "behalf_votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "user_id"
    t.bigint "feature_request_id"
    t.bigint "vote_id"
    t.bigint "submitter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_request_id"], name: "index_behalf_votes_on_feature_request_id"
    t.index ["submitter_id"], name: "index_behalf_votes_on_submitter_id"
    t.index ["user_id"], name: "index_behalf_votes_on_user_id"
    t.index ["vote_id"], name: "index_behalf_votes_on_vote_id"
  end

  create_table "blocked_organization_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_blocked_organization_users_on_organization_id"
    t.index ["user_id"], name: "index_blocked_organization_users_on_user_id"
  end

  create_table "bucket_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "bucket_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buckets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.text "hello_sentence"
    t.boolean "private", default: false
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
    t.boolean "default", default: false
    t.boolean "allow_member"
    t.string "submit_button_text"
    t.string "form_heading"
    t.text "form_description"
    t.text "form_title"
    t.text "form_title_placeholder"
    t.text "form_details"
    t.text "form_details_placeholder"
    t.boolean "intercom_submission_bucket"
    t.text "submission_template"
    t.boolean "disable_comments"
    t.string "post_key_prefix"
    t.integer "feature_requests_count", default: 0, null: false
    t.string "otl_key"
    t.boolean "read_only"
    t.index ["disable_comments"], name: "index_buckets_on_disable_comments"
    t.index ["intercom_submission_bucket"], name: "index_buckets_on_intercom_submission_bucket"
    t.index ["organization_id"], name: "index_buckets_on_organization_id"
  end

  create_table "changelog_feature_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "feature_request_id"
    t.bigint "changelog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["changelog_id"], name: "index_changelog_feature_requests_on_changelog_id"
    t.index ["feature_request_id"], name: "index_changelog_feature_requests_on_feature_request_id"
  end

  create_table "changelog_notified_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "changelog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["changelog_id"], name: "index_changelog_notified_users_on_changelog_id"
    t.index ["user_id"], name: "index_changelog_notified_users_on_user_id"
  end

  create_table "changelogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "title"
    t.text "description_html"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.boolean "published"
    t.datetime "published_at"
    t.bigint "user_id"
    t.string "slug"
    t.index ["organization_id"], name: "index_changelogs_on_organization_id"
    t.index ["user_id"], name: "index_changelogs_on_user_id"
  end

  create_table "comment_reactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "comment_id"
    t.integer "reaction_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_reactions_on_comment_id"
    t.index ["reaction_id"], name: "index_comment_reactions_on_reaction_id"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "feature_request_id"
    t.string "user_id"
    t.boolean "parent", default: true
    t.integer "parent_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.text "attachments"
    t.text "comment_html"
    t.integer "approval_status"
    t.boolean "internal"
    t.boolean "pinned"
    t.index ["approval_status"], name: "index_comments_on_approval_status"
    t.index ["internal"], name: "index_comments_on_internal"
    t.index ["pinned"], name: "index_comments_on_pinned"
    t.index ["user_id", "feature_request_id"], name: "index_comments_on_user_id_and_feature_request_id"
  end

  create_table "deactivations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "entity_type"
    t.string "entity_email"
    t.string "entity_name"
    t.text "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editor_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.text "attachment"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_editor_attachments_on_organization_id"
  end

  create_table "etc_subscribers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "feature_request_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_request_id"], name: "index_etc_subscribers_on_feature_request_id"
    t.index ["user_id"], name: "index_etc_subscribers_on_user_id"
  end

  create_table "favorite_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feature_request_assignees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "assignee_id"
    t.bigint "assignor_id"
    t.bigint "feature_request_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feature_request_interactors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "feature_request_id"
    t.integer "organization_id"
    t.integer "user_id"
    t.integer "point"
    t.integer "interaction_type"
    t.boolean "subscribed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feature_request_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "feature_request_id"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_request_id"], name: "index_feature_request_ratings_on_feature_request_id"
    t.index ["priority"], name: "index_feature_request_ratings_on_priority"
    t.index ["user_id"], name: "index_feature_request_ratings_on_user_id"
  end

  create_table "feature_request_tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "feature_request_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "organization_id"
    t.index ["feature_request_id"], name: "index_feature_request_tags_on_feature_request_id"
    t.index ["organization_id"], name: "index_feature_request_tags_on_organization_id"
    t.index ["tag_id"], name: "index_feature_request_tags_on_tag_id"
    t.index ["user_id"], name: "index_feature_request_tags_on_user_id"
  end

  create_table "feature_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "title"
    t.text "description"
    t.integer "status", default: 0
    t.integer "submitter_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bucket_id"
    t.boolean "private", default: false
    t.text "attachments"
    t.string "slug"
    t.text "description_html"
    t.string "intercom_conversation_id"
    t.integer "approval_status"
    t.boolean "pinned"
    t.integer "comments_count", default: 0, null: false
    t.integer "upvotes_count", default: 0, null: false
    t.integer "downvotes_count", default: 0, null: false
    t.datetime "completed_at"
    t.boolean "disable_comments"
    t.bigint "merged_with_id"
    t.boolean "hidden"
    t.string "jira_url"
    t.date "etc_date"
    t.integer "post_key_number"
    t.index ["approval_status"], name: "index_feature_requests_on_approval_status"
    t.index ["disable_comments"], name: "index_feature_requests_on_disable_comments"
    t.index ["hidden"], name: "index_feature_requests_on_hidden"
    t.index ["intercom_conversation_id"], name: "index_feature_requests_on_intercom_conversation_id"
    t.index ["merged_with_id"], name: "index_feature_requests_on_merged_with_id"
    t.index ["pinned"], name: "index_feature_requests_on_pinned"
    t.index ["slug"], name: "index_feature_requests_on_slug"
    t.index ["submitter_id", "organization_id"], name: "index_feature_requests_on_submitter_id_and_organization_id"
  end

  create_table "friendly_id_slugs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", length: { slug: 140 }
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "imported_csv_attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "attachment"
    t.integer "imported_for"
    t.bigint "organization_id"
    t.bigint "imported_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bucket_id"
    t.index ["bucket_id"], name: "index_imported_csv_attachments_on_bucket_id"
    t.index ["imported_by"], name: "index_imported_csv_attachments_on_imported_by"
    t.index ["organization_id"], name: "index_imported_csv_attachments_on_organization_id"
  end

  create_table "jira_issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "url"
    t.string "issue_id"
    t.bigint "feature_request_id"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "title"
    t.index ["feature_request_id"], name: "index_jira_issues_on_feature_request_id"
    t.index ["organization_id"], name: "index_jira_issues_on_organization_id"
  end

  create_table "kanban_columns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.integer "position"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_kanban_columns_on_organization_id"
  end

  create_table "kanban_entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "title"
    t.integer "position"
    t.string "header_image"
    t.string "two_liner"
    t.text "description"
    t.integer "kanban_column_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_kanban_entries_on_organization_id"
  end

  create_table "kanban_entry_feature_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "feature_request_id"
    t.string "kanban_entry_id"
    t.string "kanban_column_id"
    t.string "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_request_id"], name: "index_kanban_entry_feature_requests_on_feature_request_id"
    t.index ["kanban_column_id"], name: "index_kanban_entry_feature_requests_on_kanban_column_id"
    t.index ["kanban_entry_id"], name: "index_kanban_entry_feature_requests_on_kanban_entry_id"
    t.index ["organization_id"], name: "index_kanban_entry_feature_requests_on_organization_id"
  end

  create_table "labels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_labels_on_organization_id"
  end

  create_table "mentions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.integer "feature_request_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_mentions_on_comment_id"
    t.index ["feature_request_id"], name: "index_mentions_on_feature_request_id"
    t.index ["organization_id"], name: "index_mentions_on_organization_id"
    t.index ["user_id"], name: "index_mentions_on_user_id"
  end

  create_table "notifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "receiver_id"
    t.integer "feature_request_id"
    t.integer "organization_id"
    t.integer "notification_type"
    t.boolean "seen", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "onboarding_widgets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.integer "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_onboarding_widgets_on_organization_id"
    t.index ["step"], name: "index_onboarding_widgets_on_step"
  end

  create_table "organization_activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.integer "feature_request_id"
    t.integer "activity"
    t.integer "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "feature_request_assignee_id"
    t.integer "tag_id"
    t.index ["activity"], name: "index_organization_activities_on_activity"
    t.index ["feature_request_assignee_id"], name: "index_organization_activities_on_feature_request_assignee_id"
    t.index ["feature_request_id"], name: "index_organization_activities_on_feature_request_id"
    t.index ["organization_id"], name: "index_organization_activities_on_organization_id"
    t.index ["status"], name: "index_organization_activities_on_status"
    t.index ["tag_id"], name: "index_organization_activities_on_tag_id"
    t.index ["user_id"], name: "index_organization_activities_on_user_id"
  end

  create_table "organization_customizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "organization_id"
    t.string "brand_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "og_image"
    t.string "under_review_name"
    t.string "planned_name"
    t.string "in_progress_name"
    t.string "completed_name"
    t.string "closed_name"
    t.string "favicon"
    t.string "custom_privacy_policy_url"
    t.string "custom_support_url"
    t.boolean "display_branded_content"
    t.string "custom_about_us_url"
    t.string "custom_contact_us_url"
    t.index ["display_branded_content"], name: "index_organization_customizations_on_display_branded_content"
    t.index ["organization_id"], name: "index_organization_customizations_on_organization_id"
  end

  create_table "organization_interactor_labels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.integer "organization_interactor_id"
    t.integer "user_id"
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_organization_interactor_labels_on_label_id"
    t.index ["organization_id"], name: "index_organization_interactor_labels_on_organization_id"
    t.index ["organization_interactor_id"], name: "idx_organization_interactor_id"
    t.index ["user_id"], name: "index_organization_interactor_labels_on_user_id"
  end

  create_table "organization_interactors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.integer "point"
    t.boolean "subscribed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "starred"
    t.integer "comments_count"
    t.integer "votes_count"
    t.integer "feature_requests_count"
    t.boolean "blocked"
    t.index ["blocked"], name: "index_organization_interactors_on_blocked"
    t.index ["starred"], name: "index_organization_interactors_on_starred"
    t.index ["user_id", "organization_id"], name: "index_organization_interactors_on_user_id_and_organization_id", unique: true
  end

  create_table "organization_plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "organization_id"
    t.integer "plan"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_plans_on_organization_id"
  end

  create_table "organization_settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.string "avatar"
    t.text "hello_sentence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "moderation", default: false
    t.string "coupon"
    t.string "api_key"
    t.boolean "allow_guest_votes", default: false
    t.boolean "organization_privacy"
    t.string "intercom_app_id"
    t.string "locale"
    t.string "patreon_username"
    t.string "default_submit_button_text"
    t.boolean "mask_user_details"
    t.string "sso_token"
    t.boolean "allow_guest_submission"
    t.boolean "allow_downvote"
    t.string "widget_key"
    t.boolean "user_notification"
    t.boolean "alpha"
    t.string "bucket_singular_name"
    t.string "bucket_plural_name"
    t.string "roadmap_name"
    t.string "changelog_singular_name"
    t.string "changelog_plural_name"
    t.boolean "comments_moderation"
    t.boolean "priority_rating"
    t.boolean "allow_admin_emails"
    t.string "roadmap_planned_name"
    t.string "roadmap_in_progress_name"
    t.string "roadmap_completed_name"
    t.boolean "roadmap"
    t.boolean "partial_mask_user_details"
    t.boolean "enable_kanban_roadmap"
    t.string "roadmap_under_review_name"
    t.string "roadmap_closed_name"
    t.boolean "roadmap_under_review_view"
    t.boolean "roadmap_planned_view"
    t.boolean "roadmap_in_progress_view"
    t.boolean "roadmap_completed_view"
    t.boolean "roadmap_closed_view"
    t.boolean "auto_upvote"
    t.boolean "notify_vote_on_behalf"
    t.index ["allow_admin_emails"], name: "index_organization_settings_on_allow_admin_emails"
    t.index ["allow_downvote"], name: "index_organization_settings_on_allow_downvote"
    t.index ["allow_guest_submission"], name: "index_organization_settings_on_allow_guest_submission"
    t.index ["alpha"], name: "index_organization_settings_on_alpha"
    t.index ["auto_upvote"], name: "index_organization_settings_on_auto_upvote"
    t.index ["comments_moderation"], name: "index_organization_settings_on_comments_moderation"
    t.index ["enable_kanban_roadmap"], name: "index_organization_settings_on_enable_kanban_roadmap"
    t.index ["mask_user_details"], name: "index_organization_settings_on_mask_user_details"
    t.index ["notify_vote_on_behalf"], name: "index_organization_settings_on_notify_vote_on_behalf"
    t.index ["organization_id"], name: "index_organization_settings_on_organization_id"
    t.index ["partial_mask_user_details"], name: "index_organization_settings_on_partial_mask_user_details"
    t.index ["priority_rating"], name: "index_organization_settings_on_priority_rating"
    t.index ["roadmap"], name: "index_organization_settings_on_roadmap"
    t.index ["roadmap_closed_view"], name: "index_organization_settings_on_roadmap_closed_view"
    t.index ["roadmap_completed_view"], name: "index_organization_settings_on_roadmap_completed_view"
    t.index ["roadmap_in_progress_view"], name: "index_organization_settings_on_roadmap_in_progress_view"
    t.index ["roadmap_planned_view"], name: "index_organization_settings_on_roadmap_planned_view"
    t.index ["roadmap_under_review_view"], name: "index_organization_settings_on_roadmap_under_review_view"
    t.index ["sso_token"], name: "index_organization_settings_on_sso_token"
    t.index ["widget_key"], name: "index_organization_settings_on_widget_key"
  end

  create_table "organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
    t.string "url"
    t.text "description"
    t.string "avatar"
    t.string "coupon"
    t.string "custom_domain"
    t.integer "origin"
    t.boolean "onboarding_completed"
    t.index ["custom_domain"], name: "index_organizations_on_custom_domain"
    t.index ["onboarding_completed"], name: "index_organizations_on_onboarding_completed"
    t.index ["origin"], name: "index_organizations_on_origin"
  end

  create_table "payment_alert_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "alert_id"
    t.string "alert_name"
    t.bigint "checkout_id"
    t.string "country"
    t.string "coupon"
    t.string "currency"
    t.bigint "earnings"
    t.bigint "user_id"
    t.bigint "organization_id"
    t.datetime "event_time"
    t.datetime "next_action_date"
    t.bigint "next_payment_amount"
    t.bigint "order_id"
    t.string "passthrough"
    t.string "payment_method"
    t.string "plan_name"
    t.string "receipt_url"
    t.bigint "amount"
    t.bigint "subscription_id"
    t.bigint "plan_subscription_id"
    t.bigint "subscription_payment_id"
    t.bigint "subscription_plan_id"
    t.bigint "unit_price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_name"], name: "index_payment_alert_logs_on_alert_name"
    t.index ["organization_id"], name: "index_payment_alert_logs_on_organization_id"
    t.index ["plan_subscription_id"], name: "index_payment_alert_logs_on_plan_subscription_id"
    t.index ["status"], name: "index_payment_alert_logs_on_status"
    t.index ["user_id"], name: "index_payment_alert_logs_on_user_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "plan"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "uid"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "organization_id"
    t.bigint "user_id"
    t.text "price_info"
    t.text "extra_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source"
    t.integer "plan"
    t.text "receipt_url"
    t.integer "order_id"
    t.text "cancel_url"
    t.text "update_url"
    t.integer "status"
    t.index ["organization_id"], name: "index_plan_subscriptions_on_organization_id"
    t.index ["user_id"], name: "index_plan_subscriptions_on_user_id"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.string "display_name"
    t.integer "organization_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.boolean "promotions"
    t.boolean "updates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name"
    t.integer "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organization_id"
    t.index ["organization_id"], name: "index_tags_on_organization_id"
  end

  create_table "user_organizations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "user_id"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "slack_channel"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "profile_picture"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "onboarded"
    t.string "hmac"
    t.boolean "guest", default: false
    t.string "username"
    t.string "fcm_token"
    t.boolean "dark_theme"
    t.integer "origin"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["origin"], name: "index_users_on_origin"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "feature_request_id"
    t.integer "user_id"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "organization_id"
    t.index ["user_id", "feature_request_id"], name: "index_votes_on_user_id_and_feature_request_id"
  end

  create_table "zaps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer "organization_id"
    t.integer "zap_type"
    t.text "target_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "info"
  end

  add_foreign_key "jira_issues", "feature_requests"
  add_foreign_key "jira_issues", "organizations"
  add_foreign_key "plan_subscriptions", "organizations"
  add_foreign_key "plan_subscriptions", "users"
end
