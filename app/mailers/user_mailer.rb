class UserMailer < ApplicationMailer

  default from: 'noreply@icats.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue sur iCats !') 

  end


  def order_email(user)
  	@user = user 
  	@content = user.cart.items
    attachments['1.jpg'] = File.read('app/assets/images/1.jpg')
    attachments['2.jpg'] = File.read('app/assets/images/2.jpg')
  	# c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Merci pour votre commande sur iCats !') 
  	
  	# Commande pour envoi du mail order

  end

end
