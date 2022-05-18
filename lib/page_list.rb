require_relative 'webpage'

class PageList
  attr_reader :web_pages, :file_path

  def initialize(file_path)
    @web_pages = []
    @file_path = file_path
    parse_file
  end

  def parse_file
    File.open(@file_path).each do |line|
      page_name = line.split(' ').first.to_s
      ip_address = line.split(' ').last.to_s
      if @web_pages.empty?
        add_new_page(page_name, ip_address)
      else
        update_or_add_page(page_name, ip_address)
      end
    end
  end

  def update_or_add_page(page_name, ip_address)
    index = @web_pages.find_index { |page| page.page_name == page_name }
    if index.nil?
      add_new_page(page_name, ip_address)
    else
      update_page(index, ip_address)
    end
  end

  def update_page(index, ip_address)
    web_pages[index].add_ip_address(ip_address)
  end

  def add_new_page(page_name, ip_address)
    web_pages << Page.new(page_name, ip_address)
  end

  def print_all
    print_text = ''
    if @web_pages.empty?
      print_text = 'We found no logs in the provided file. Please ensure the file contains data.'
    else
      sorted_pages = @web_pages.sort_by(&:total_views).reverse
      sorted_pages.each do |sorted_page|
        print_text += "Page #{sorted_page.page_name} has #{sorted_page.total_views} total views\n"
      end
    end
    print_text
  end

  def print_unique
    print_text = ''
    if @web_pages.empty?
      print_text = 'We found no logs in the provided file. Please ensure the file contains data.'
    else
      sorted_pages = @web_pages.sort_by(&:unique_views).reverse
      sorted_pages.each do |sorted_page|
        print_text += "Page #{sorted_page.page_name} has #{sorted_page.unique_views} unique views\n"
      end
    end
    print_text
  end
end
