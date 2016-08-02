pdf.text "Contact ##{@contact.id} ", :size => 30, :style => :bold, :align => :center
pdf.move_down(30)
if @contact.image_url.present?
pdf.image "public#{@contact.image_url}", :position => :center, :scale => 0.25
else
pdf.image "app/assets/images/user-default-XL.png", :position => :center, :scale => 0.25
end
pdf.move_down(20)
pdf.text "Prenom : #{@contact.first_name}", :size => 15, :align => :center
pdf.move_down(20)
pdf.text "Nom : #{@contact.last_name}", :size => 15, :align => :center
pdf.move_down(20)
pdf.text "Telephone : #{@contact.phone}", :size => 15, :align => :center
pdf.move_down(20)
pdf.text "Email : #{@contact.email}", :size => 15, :align => :center
pdf.move_down(20)
pdf.text "Adresse : #{@contact.address}", :size => 15, :align => :center
pdf.move_down(30)
