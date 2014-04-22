require 'sinatra'
require 'sinatra/reloader'
require './fx'

# Bank Sources
sources = {
  cb: 'http://www.cbbank.com.mm/exchange_rate.aspx',
  kbz: 'http://www.kbzbank.com/en',
  agd: 'http://www.agdbank.com/category/exchange-rate/',
  central: 'http://forex.cbm.gov.mm/api/latest'
}

get '/:bank' do
  content_type :json
  case params[:bank]
  when 'agd'
    JSON.pretty_generate(Currencies.new(Nokogiri::HTML(open(sources[:agd])),
                                        'AGD').to_hash)
  when 'cb'
    JSON.pretty_generate(Currencies.new(Nokogiri::HTML(open(sources[:cb])),
                                        'CB').to_hash)
  when 'kbz'
    JSON.pretty_generate(KBZ.new.to_hash_kbz)
  else
    status 404
    'Wrong argument. Plase put either AGD or CB or KBZ'
  end
end
