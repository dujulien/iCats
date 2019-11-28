class UserMailer < ApplicationMailer

  default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue sur iCats !') 
  end

  def order_email(user)
  	@user = user
  	attachments['kitty.jpg'] = File.read(Dir.glob("#{Rails.root}/app/assets/1.jpg"))

    mail(to: @user.email, subject: 'Thank you for your purchase !') 
  end

end
