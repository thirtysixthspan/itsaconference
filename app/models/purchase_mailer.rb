class PurchaseMailer < ActionMailer::Base

  def notice(purchase)
    @recipients = purchase.email
    @from = "registration@reddirtrubyconf.com"
    @bcc = "registration@reddirtrubyconf.com"
    @subject = "[RedDirtRubyConf] Recent Purchase"
    @sent_on = Time.now
    @body[:purchase]=purchase
    @content_type = "text/html"
    @charset = "iso-8859-1"
  end  


  def payment_failed(purchase)
    @recipients = purchase.email
    @from = "registration@reddirtrubyconf.com"
    @bcc = "registration@reddirtrubyconf.com"
    @subject = "[RedDirtRubyConf] Your payment failed"
    @sent_on = Time.now
    @body[:purchase]=purchase
    @content_type = "text/html"
    @charset = "iso-8859-1"
  end  


  def purchase_confirmed(purchase)
    @recipients = purchase.email
    @from = "registration@reddirtrubyconf.com"
    @bcc = "registration@reddirtrubyconf.com"
    @subject = "[RedDirtRubyConf] Your payment was successfully processed"
    @sent_on = Time.now
    @body[:purchase]=purchase
    @content_type = "text/html"
    @charset = "iso-8859-1"
  end  

end
