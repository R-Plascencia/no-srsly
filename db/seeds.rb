# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Sources
# :Reuters_Politics => 'http://feeds.reuters.com/Reuters/PoliticsNews',
# :Reuters_Domestic => 'http://feeds.reuters.com/Reuters/domesticNews',
# :BBC => 'http://feeds.bbci.co.uk/news/world/us_and_canada/rss.xml',
# :WSJ => 'http://www.wsj.com/xml/rss/3_7085.xml',
# :FactCheck => 'https://www.factcheck.org/feed/', #skip getting summary for this - there isn't one
# :Politifact => 'http://www.politifact.com/feeds/statements/truth-o-meter/', # need to strip HTML
# :USA_Today => 'http://rssfeeds.usatoday.com/usatodaycomwashington-topstories&x=1' #need to strip HTML

#--------
# ADD NEW SOURCES HERE
#--------
Source.create(
    :name => 'Reuters Domestic', 
    :website => 'https://www.reuters.com/news/us',
    )

Source.create(
        :name => 'Reuters Politics', 
        :website => 'https://www.reuters.com/politics',
    )

Source.create(
    :name => 'BBC', 
    :website => 'https://www.bbc.com/',
    )

Source.create(
    :name => 'Wall St. Journal (WSJ)', 
    :website => 'https://www.wsj.com/',
    )

Source.create(
    :name => 'FactCheck', 
    :website => 'https://www.factcheck.org/',
    )

Source.create(
    :name => 'Politifact', 
    :website => 'https://www.politifact.com/',
    )

Source.create(
    :name => 'USA Today', 
    :website => 'https://www.usatoday.com/',
    )
