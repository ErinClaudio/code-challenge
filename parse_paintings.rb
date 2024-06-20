require 'nokogiri'
require 'json'

  def extract_painting_data(html_file)
    doc = Nokogiri::HTML(File.read(html_file))

    paintings = doc.css('a[title]').map do |element|
      title = element['title']
      link = "https://www.google.com#{element['href']}"
      aria_label = element['aria-label']
      image_url = element.at_css('img')['src'] if element.at_css('img')

      if aria_label&& title
        name, year = extract_name_and_year(title)
        {
          name: name,
          extensions: year ? [year] :[],
          link: link,
          image: image_url
        }
      end
    end.compact
    paintings
  end

  def extract_name_and_year(title)
    match = title.match(/(.*?)(\((\d{4})\))?$/)
    name = match[1].strip
    year = match[3]
    [name, year]
  end

  def save_to_json(paintings, output_file)
    File.write(output_file, JSON.pretty_generate(paintings))
  end

if __FILE__ == $0
  paintings = extract_painting_data('files/van-gogh-paintings.html')
  save_to_json(paintings,'extracted_results.json')
end