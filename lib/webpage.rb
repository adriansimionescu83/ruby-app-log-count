require 'pry-byebug'

class Page
  attr_reader :page_name, :total_views, :unique_views, :ip_addresses

  def initialize(name, ip_address)
    @page_name = name
    @ip_addresses = []
    @ip_addresses << ip_address.to_s
    @unique_views = 1
    @total_views = 1
  end

  def set_total_views
    @total_views = @ip_addresses.length
  end

  def set_unique_views
    @unique_views = @ip_addresses.uniq.length
  end

  def add_ip_address(ip_address)
    @ip_addresses << ip_address
    set_total_views
    set_unique_views
  end
end
