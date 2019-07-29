# == Schema Information
# Schema version: 20190724194344
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  when_date   :date
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address     :text
#  latitude    :float
#  longitude   :float
#


class Event < ActiveRecord::Base


  validates :title, presence: true, length: { minimum: 2, maximum: 40}
  validates :description, presence: true, length: { minimum: 3, maximum: 300 }
  validates :user_id, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  belongs_to :user


end
