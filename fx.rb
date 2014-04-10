require 'nokogiri'
require 'pp'
require 'json'
require 'open-uri'
require 'net/http'

# Bank Sources
sources = {
  cb: "http://www.cbbank.com.mm/exchange_rate.aspx",
  kbz: "http://www.kbzbank.com/en",
  agd: "http://www.agdbank.com/category/exchange-rate/",
  central: "http://forex.cbm.gov.mm/api/latest"
}

class KBZ
  @doc = Nokogiri::HTML(open("http://www.kbzbank.com/en"))
  @x = @doc.css("tr")[1..4].text.gsub(/\n/,' ').chomp.split()

  def to_hash_KBZ
  {
    bank: "KBZ",
    rates:  {
      USD:KBZ.kbz_usd,
      EURO:KBZ.kbz_euro,
      SGD:KBZ.kbz_sgd,
    }
  }
  end

  def KBZ.kbz_usd
    "[#{@x[1]},#{@x[2]}]"
  end

  def KBZ.kbz_euro
    "[#{@x[4]},#{@x[5]}]"
  end

  def KBZ.kbz_sgd
    "[#{@x[7]},#{@x[8]}]"
  end
end

class Currencies
  def initialize (page, bank)
    @page = page
    @bank = bank
  end

  def parsed
    @parsed ||= @page.css("tr")[0..3].collect{|el| el.text.gsub(/\s+/,'') }
  end

  def parsed_CB
    @parsed_CB ||= @page.css("tr")[1..4].collect{|el| el.text.gsub(/\s+/,'')}
  end

  # To hash method for AGD
  def to_hash
  {
    bank: @bank,
    timestamp: time,
    rates: {
      USD: usd,
      SGD: sgd,
      EURO: euro,
    }
  }
  end

  def usd
    parsed[1].gsub(/\D/,'').to_s.scan(/.../).map { |h| h.to_i}.to_s
  end

  def sgd
    if @bank == "AGD"
      parsed[2].gsub(/[^0-9]|s+/,'').to_s.scan(/.../).map { |h| h.to_i}.to_s
    else
      parsed_CB[2].gsub(/[^0-9]|s+/,'').to_s.scan(/.../).map {|h| h.to_i}.to_s
    end
  end

  def euro
    if @bank == "AGD"
      parsed[3].gsub(/[^0-9]|s+/,'').to_s.scan(/..../).map { |h| h.to_i}.to_s
    else
      parsed_CB[1].gsub(/[^0-9]|s+/,'').to_s.scan(/..../).map {|h| h.to_i}.to_s
    end
  end

  def time
    if @bank == "AGD"
      parsed[0].to_s.gsub(/\(.+/,'').gsub(/th/,' ').to_s + " " + parsed[0].to_s.scan(/\(([^\)]+)\)/).join('').to_s
    else
      parsed_CB[3].to_s
    end
  end
end
