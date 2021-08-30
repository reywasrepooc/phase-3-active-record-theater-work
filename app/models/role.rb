require 'pry'
class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map(&:actor)
  end

  def locations
    auditions.map(&:location)
  end

  def lead
    lead_role = auditions.where(hired: "true")
    lead_role.length.positive ? lead_role.first : "no actor has been hired for this role"
  end

  def understudy
    understudy = auditions.where(hired: "true")
    understudy.length > 1 ? understudy.second : "no actor has been hired for this role"
  end
end
