require './fx'
# Bank Sources
sources = {
  cb: "http://www.cbbank.com.mm/exchange_rate.aspx",
  kbz: "http://www.kbzbank.com/en",
  agd: "http://www.agdbank.com/category/exchange-rate/",
  central: "http://forex.cbm.gov.mm/api/latest"
}

case ARGV[0]
when "AGD"
  puts JSON.pretty_generate(Currencies.new(Nokogiri::HTML(open(sources[:agd])),"AGD").to_hash)
when "CB"
  puts JSON.pretty_generate(Currencies.new(Nokogiri::HTML(open(sources[:cb])),"CB").to_hash)
when "KBZ"
  puts JSON.pretty_generate(KBZ.new.to_hash_KBZ)
else
  raise ArgumentError, "Wrong argument. Plase put either AGD or CB or KBZ"
end
