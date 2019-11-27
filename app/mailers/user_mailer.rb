class UserMailer < ApplicationMailer

  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue sur iCats !') 
  end


  def order_email(user)
  	@user = user 

  	# c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Merci pour votre commande sur iCats !') 
  	
  	# Commande pour envoi du mail order
  	# UserMailer.order_confirmation_send(self).deliver_now

  end

end
