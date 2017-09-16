class PostmarkMailer < ApplicationMailer
  def reset(user)
    @user = user
    mail(
      :to  => user.email,
      :from => 'hello@2prointl.co',
      :subject => 'Your Reset Code',
      :track_opens => 'true')
  end
  def verify(user)
    @user = user
    mail(
      :to  => user.email,
      :from => 'hello@2prointl.co',
      :subject => 'Your Validation Code',
      :track_opens => 'true')
  end
  def support(t, u)
    @t = t
    mail(
      :to  => u,
      :from => 'hello@2prointl.co',
      :subject => 'New reply to your ticket',
      :track_opens => 'true')
  end
  def support_admin(t, u)
    @t = t
    mail(
      :to  => u,
      :from => 'hello@2prointl.co',
      :subject => 'A new ticket has just been opened',
      :track_opens => 'true')
  end
end
