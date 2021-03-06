class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :comments,
             dependent: :destroy

  has_many   :bookmarks,
             class_name: "SavedDetail",
             dependent: :destroy

  has_many   :projects,
             foreign_key: "project_manager_id",
             dependent: :destroy

  has_many   :assigned_project,
             class_name: "Designer",
             dependent: :destroy

  # Indirect associations

  has_many   :details,
             through: :assigned_project,
             source: :details

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
