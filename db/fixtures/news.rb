News.seed(:title, :post_date) do |s|  

  s.title = "Call for Proposals is now open"   
  s.author = "Derrick Parkhurst" 
  s.post = "<p>We are now <a href='/call_for_proposals'>accepting proposals</a> for talks within the <a href='/themes'>four conference themes</a>. The deadline for submitting a proposal is February 28th.</p>"
  s.post_date = Time.local(2010,"feb",1,12,0,0) 
end
