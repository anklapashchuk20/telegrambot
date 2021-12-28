
require File.expand_path('../config/environment',__FILE__)
require 'telegram/bot'

TOKEN = '5023176196:AAGvcGWv6UoDt6lPCfAn-GBqDA4yIpSjIos'

Telegram::Bot::Client.run(TOKEN) do |bot|
	bot.listen do |message|
    case message.text
    when /^\/start/
    	bot.api.send_message(chat_id: message.chat.id, text: "Привіт, #{message.from.first_name}!")
    	bot.api.send_message(chat_id: message.chat.id, text: "Зараз я розкажу, що в мене є цікавого")
    	bot.api.send_message(chat_id: message.chat.id, text: "/books - переглянути топ-40 книг")
    	bot.api.send_message(chat_id: message.chat.id, text: "/authors - переглянути популярних авторів")
    	
    when /^\/stop/
    	bot.api.send_message(chat_id: message.chat.id, text: "Бувай, #{message.from.first_name}!")
    when /^\/books/
        @books = Book.all
        array = @books.map { |bk| bk.title }
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: array)
        bot.api.send_message(
                chat_id: message.chat.id,
                text: "Книги", reply_markup: markup)  

when /^\/authors/
        @creators = Creator.all
        array2 = @creators.map { |auth| auth.author }
        bot.api.send_message(
                chat_id: message.chat.id,
                text: array2)
    when /^\w/
            @books = Book.all
            if @books.map { |bk| bk.title }.include?(message.text)
                bk = Book.where("title LIKE ?", "%#{message.text}%")

                @review = Article.find_by(book_id: bk)
                
                bot.api.send_message(
                    chat_id: message.chat.id,
                    text: "Назва: #{@review.book.title}\n Автор: #{@review.creator.author}\n Ціна: #{@review.price}\n  Опис: #{@review.description}")
                
            else 
                bot.api.send_message(
                   chat_id: message.chat.id,
                   text: "Не можу знайти (")
            end
     
    end
     
end
end

