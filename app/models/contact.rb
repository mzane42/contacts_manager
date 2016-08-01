class Contact < ActiveRecord::Base

  def self.nb_contacts
      Contact.count
  end

end
