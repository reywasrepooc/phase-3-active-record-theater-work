class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    auditions.map { |audition| audition.actor}
  end

  def locations
    auditions.map { |audition| audition.location}
  end

  def lead
    lead_role = auditions.where(hired: "true")
    lead_role > 0 ? lead_role.first : "no actor has been hired for this role"
  end

  def understudy
    understudy = auditions.where(hired: "true")
    understudy > 1 ? understudy.second : "no actor has been hired for this role"
  end
end
