# TweetArchiver
A  simple  application  for  archiving  and  displaying  Tweets.  You  can
imagine this being a component in a larger application that allows users to keep tabs
on search terms relevant to their businesses. This example will demonstrate how easy
it is to consume JSON from an API like Twitter’s and convert that to MongoDB documents.

If you were doing this with a relational database, you’d have to devise a schema
in advance, probably consisting of multiple tables, and then declare those tables. Here,
none of that’s required, yet you’ll still preserve the rich structure of the Tweet docu-
ments, and you’ll be able to query them effectively.

TweetArchiver  will  consist  of  two  components:
* the archiver and the viewer. The archiver will call the Twitter search API and store the relevant Tweets
* the viewer will display the results in a web browser.
