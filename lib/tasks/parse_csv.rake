require 'csv'

task parse_csv: :environment do
  csv_content = File.read('Books.csv')
  csv         = CSV.parse(csv_content, :headers => false, quote_char: "\x00")
  csv.each do |row|
    book = Book.where(:rating => row[0], :title => row[1]).first_or_create
    creator = Creator.where(:author => row[2]).first_or_create
    seller  = Seller.where(:vendor => row[3]).first_or_create
    Article.create(
      :book_id          => book.id,
      :creator_id       => creator.id,
      :seller_id        => seller.id,
      :price            => row[4],
      :description      => row[5],
      )
  end
end
