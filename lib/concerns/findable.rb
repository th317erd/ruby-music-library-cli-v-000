module Concerns::Findable
  # Module code here
  def find_by_name(name)
    self.all.detect {|x| x.name == name}
  end
  
  def find_or_create_by_name(name)
    found = self.find_by_name(name)
    if found == nil
      self.create(name)
    else
      found
    end
  end
end
