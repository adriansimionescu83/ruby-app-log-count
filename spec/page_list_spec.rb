require 'page_list'

describe '1. Webserver Log with at least one page view' do
  context '1.1. All page views sorted' do
    let(:page_list) { PageList.new("#{File.dirname(__FILE__)}/../spec/webserver.log") }

    it '1.1.1. Should return a string' do
      expect(page_list.print_all).to be_a String
    end

    it '1.1.2. Should return a list of web pages sorted by the number of total views' do
      target = "Page /help_page has 4 total views
Page /help_page/2 has 3 total views
Page /home has 2 total views
Page /contact has 1 total views
"
      expect(page_list.print_all).to eq target
    end

    it '1.1.3. Should return a list of web pages sorted by the number of unique views' do
      target = "Page /help_page/2 has 3 unique views
Page /help_page has 2 unique views
Page /home has 1 unique views
Page /contact has 1 unique views
"
      expect(page_list.print_unique).to eq target
    end
  end
end

describe '2. Webserver Log with no content (page views)' do
  context '2.1. Should return a message if the log is empty' do
    let(:page_list) { PageList.new("#{File.dirname(__FILE__)}/../spec/webserver_empty.log") }

    it '2.1.1. Specific message to be returned if user tries to list all page views' do
      target = 'We found no logs in the provided file. Please ensure the file contains data.'
      expect(page_list.print_all).to eq target
    end

    it '2.1.1. Specific message to be returned if user tries to list the unique page views' do
      target = 'We found no logs in the provided file. Please ensure the file contains data.'
      expect(page_list.print_all).to eq target
    end
  end
end
