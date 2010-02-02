   
Theme.seed(:title) do |s|  
  s.title = "RUBY"   
  s.link = "ruby"
  s.icon = "/images/ruby_icon.png"  
  s.one_line_description = "The Ruby language still has the power to surprise us. This theme is focused on Ruby syntax, gems and good development practices."
  s.long_description = 
"<p>Ruby is a very dynamic programming language designed to feel natural to the programmers that use it. While that is easy to appreciate, 
it does mean the language has many layers of complexity. Even programmers who have worked with Ruby many years can still be 
surprised by new subtleties that they discover.</p>

<p>Working with a language as expressive as Ruby translates to libraries that can model our problems in exciting new ways. 
Ruby on Rails is famous for how it re-conceived web application development, but Ruby has many tools that do exciting things 
for specific domains. To give just one example, the Nokogiri library provides many exciting ways to manipulate XML or HTML data.</p>

<p>With all of that power at their fingertips, some developers have changed how they build software. Some software design strategies 
used with other languages need to be handled differently in Ruby and some don’t apply at all. Ruby’s rich metaprogramming helps us 
to change the language itself to fit each challenge we face. Additionally, a tight focus on testing helps Rubyists ensure that the 
language is behaving as they expect.</p>

<p>We are seeking talks that concern the Ruby language beneath everything we do. Come show us your favorite side of the 
Ruby or show us elegant ways that you utilize it.</p>"

end  
  
Theme.seed(:title) do |s|  
  s.title = "RAILS 3"   
  s.link = "rails3"
  s.icon = "/images/rails_icon.png"  
  s.one_line_description = "Ruby on Rails is crossing a huge milestone. This theme is centered on topics such routing, metal, the new response system, and advanced queries."
  s.long_description = 
"<p>Ruby on Rails shook up the web development community when it was released. It turned many standard practices of the day on their 
head and dramatically changed how we build web applications. Today, it’s still extremely popular in the world of the web due to these 
fundamental design principles.</p>

<p>Rails started new trends that didn’t end with that initial release. The community rethought web protocols all the way down the 
stack with smaller frameworks like Rack and Sinatra. Competitive frameworks also sprang up claiming to do much of what Rails did, 
only better. </p>

<p>In an exciting twist, the Rails team has acknowledged this growth. It moved to support Rack and continues to offer lightweight 
options for critical pieces of the application stack. The team also elected to merge in the code and ideas from Merb, one of the 
biggest competing frameworks in Ruby. All of this change culminates in the version 3 release of Rails, just in time for our conference.
</p>
  
<p>We invite you to select a specific aspect of Rails 3 and propose a talk. Some suggestions include routing, database queries, 
rendering, sending emails, or any other area of rails that has been affected. You might also consider proposing a more general topic such
as how to upgrade an existing Rails application to Rails 3.</p>"

end  

Theme.seed(:title) do |s|  
  s.title = "NoSQL"   
  s.link = "nosql"
  s.icon = "/images/nosql_icon.png"  
  s.one_line_description = "Database choice affects application performance and scalability. This theme will focus on databases such as MognoDB, Riak, Redis, and Tokyo Cabinet."
  s.long_description = 
"<p>The traffic on the web looks dramatically different today than it did in the past. Content generation was limited to a few select 
groups and the content was for the most part static. During this era, SQL became a standard tool for working with such data and it's 
design is centered on the fact that writing to a database was very rare and always tightly controlled.</p> 

<p>SQL remains a useful and general purpose tool, but the nature and frequency of data transaction has changed. People now 
generate content almost as often as they access it. The amount of data that sites like Twitter and Facebook collect and store in internal
databases each day is staggering. This dynamic has led to new challenges in maintaining speed and supporting large scale applications.</p>

<p>The NoSQL movement has answered this call by provided us with many new tools. Document databases, key-value stores, in-memory caches, and 
message queues all provide new ways of managing data. Ruby now has support for most of these tools including MongoDB, CouchDB, Redis, Tokyo 
Cabinet, and Riak. It even has some Ruby specific options, like Friendly.</p>

<p>We are interested in how you are using these tools to increase the speed and scale of your applications. 
We are looking for presentations that show what your favorite NoSQL database can do, and that wow us with applications 
that use NoSQL with large, dynamic data sets.</p>"

end

Theme.seed(:title) do |s|  
  s.title = "SERVERS"   
  s.link = "servers"
  s.icon = "/images/web_icon.png"  
  s.one_line_description = "Ruby is well suited for web based applications. This theme will focus on tools such as Rack, Unicorn, EventMachine, Resque and AWS."
  s.long_description = 
"<p>Ruby sees extensive use in servers. Part of that is attributable to the success of Rails. However, this is a broad space with 
many interesting areas of active development from how to deploy a Rack application on Unicorn, to how to monitor server health 
with Scout, or how to take advantage of the new web Socket API for HTML 5.</p>

<p>This is also the era of cloud computing and the very nature of servers is changing. Applications are now deployed 
on virtual slices offered by companies like Slicehost or in server clouds like those run by Engine Yard. Recently, Heroku 
has greatly simplified cloud deployment by creating a web service that allows you to install a gem, run some commands, and see your 
application running online just moments later.</p>

<p>Ruby isn’t just about web applications though. There are great frameworks like EventMachine and daemon-kit that make it easy 
to develop robust server application and/or background software services. There are even multiple APIs available if you just 
want to store some files to Amazon S3.</p>

<p>It’s becoming rare to deploy any kind of application without thinking about servers in some form. Ruby is a 
great citizen in this online ecosystem and we invite you to share your tips and tricks for hosting and deployment, as well 
as new server applications.</p>"

end  






  