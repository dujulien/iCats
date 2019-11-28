class UserMailer < ApplicationMailer

  default from: 'noreply@icats.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    # c'est cet appel à mail() qui permet d'envoyer l'e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue sur iCats !') 
  end


  def order_email(user)
  	@user = user 
  	@content = user.cart.items
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    @content.each do |i|
      attachments["#{i.id}.jpg"] = File.read("app/assets/images/#{i.id}.jpg")
    end
  	# c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Merci pour votre commande sur iCats !')   	
  end


  def order_to_admin(user)
    @user = user
    attachments.inline['logo.png'] = File.read('app/assets/images/logo.png')
    @content = user.cart.items
    mail(to: "icat.thp.store@gmail.com", subject: "Nouvelle commande de #{@user.name}!")     
  end

end

