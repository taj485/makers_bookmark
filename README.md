Connecting to SQL Database:
-------
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

User Story:
-------
As a time-pressed user
So that I can quickly go to web sites I regularly visit
I would like to see a list of bookmarks

As a time-pressed user
So that I can save a website
I would like to add the site's address and title to bookmark manager

Feature List:
-------
Show a list of bookmarks ✅
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users manage their bookmarks

Interacting with Postgresql from irb

2.6.0 :001 > require 'pg'
 => true
2.6.0 :002 > connection = PG.connect(dbname: 'bookmark_manager')
 => #<PG::Connection:0x00007f88d5a2d0e0>
2.6.0 :003 > result = connection.exec('SELECT* FROM bookmarks')
 => #<PG::Result:0x00007f88d5a3f4c0 status=PGRES_TUPLES_OK ntuples=2 nfields=2 cmd_tuples=2>
2.6.0 :004 > result.each {|bookmark| puts bookmark}
{"id"=>"1", "url"=>"https://medium.com"}
{"id"=>"2", "url"=>"https://google.com"}
