class Role < ActiveRecord::Base
  has_many :users
  has_many :members
  has_many :project_roles

  serialize :permissions, Hash
  
  def search_hash(h, search)
    return h[search] if h.fetch(search, false)

    h.keys.each do |k|
     answer = search_hash(h[k], search) if h[k].is_a? Hash
     return answer if answer
    end

    false
  end
end
