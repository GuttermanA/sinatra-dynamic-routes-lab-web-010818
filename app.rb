require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get '/reversename/:name' do
    @reverse_name = params[:name].reverse
    "#{@reverse_name}"
  end

  get '/square/:number' do
    @square = params[:number].to_i * params[:number].to_i
    "#{@square}"
  end

  get '/say/:number/:phrase' do
    @number = params[:number].to_i
    @phrase = params[:phrase]
    string = ""
    @number.times do |i|
      string += "#{@phrase}"
    end
    string
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    # 5.times do |i|
    #   "#{params[:"word#{i + 1}"]}"
    # end
    "#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
  end

  get '/:operation/:number1/:number2' do
    @operator = params[:operation]
    if @operator == "add"
      @operator = "+"
    elsif @operator == "subtract"
      @operator = "-"
    elsif @operator == "multiply"
      @operator = "*"
    elsif @operator = "divide"
      @operator = "/"
    else
      "Invalid operator"
      break
    end
    
    @answer = params[:number1].to_i.send(@operator, params[:number2].to_i)
    "#{@answer}"
  end
end
