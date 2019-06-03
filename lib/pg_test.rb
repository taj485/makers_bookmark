require 'pg'

begin

    con = PG.connect :dbname => 'bookmark_manager', :user => 'student'

    rs = con.exec "SELECT * FROM bookmarks"

    rs.each do |row|
      puts "%s %s %s" % [ row['id'], row['url'] ]
    end

rescue PG::Error => e

    puts e.message

ensure

    rs.clear if rs
    con.close if con

end
