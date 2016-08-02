class Contact < ActiveRecord::Base
  #mount carrierwave
  mount_uploader :image, ImageUploader
  def self.nb_contacts
      Contact.count
  end

end
