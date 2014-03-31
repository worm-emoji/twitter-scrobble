twitter-scrobble
================

this is a tiny script which copies the last scrobbled song on one's last.fm profile to one's twitter location field.

installation 
===========

1. clone the repo and run `bundle install` to get dependencies

2. fill in your last.fm user name on line 10 for the `username` variable

3. register a [twitter dev account](https://dev.twitter.com/) and generate the necessary API credentials for twitter

4. set up a cronjob so your profile is always accurate. i use  `*/5 * * * * ruby ~/twitter-scrobble/scrobble` in my crontab, but set up something that works for u

etc
===

project copyright luke miles + contributors

mit license
