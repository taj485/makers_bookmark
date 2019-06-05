require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] = "test"
      p "@@@@"
      p "i am running test environment"
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      p "@@@@"
      p "i am running developemnt environment"
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map {|bookmark| bookmark['url']}
  end

end
