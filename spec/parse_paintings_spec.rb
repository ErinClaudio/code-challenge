require_relative '../parse_paintings.rb'

RSpec.describe 'extract_painting_data' do
  let(:html_content_frida) do
    File.read('spec/test_kahlo_paintings.html')
  end

  let(:html_content_picasso) do
    File.read('spec/test_picasso_paintings.html')
  end

  let(:html_content_van_gogh) do
    File.read('spec/test_van_gogh_paintings.html')
  end

  it 'extracts Van Gogh paintings correctly from the mock HTML file' do
    expected = [
      {
        name: "The Starry Night",
        extensions: ["1889"],
        link: "https://www.google.com/path/to/starry-night",
        image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/"
      },
      {
        name: "Sunflowers",
        extensions: [],
        link: "https://www.google.com/path/to/sunflowers",
        image: "data:image/jpeg;base64,/9j/4fasdQSkZJRgABAQAAAQABAAD/"
      },
      {
        name: "Irises",
        extensions: ["1889"],
        link: "https://www.google.com/path/to/irises",
        image: "data:image/jpeg;base64,/9j/4Aasdfasdfasdfasdfasdfads/"
      },
      {
        name: "Wheatfield with Crows",
        extensions: ["1890"],
        link: "https://www.google.com/path/to/wheatfield",
        image: "data:image/jpeg;base64,/9j/fasdfasdfasdfADSDADAAD/"
      }
    ]
    result = extract_painting_data('spec/test_van_gogh_paintings.html')
    expect(result).to eq(expected)
  end

  it 'extracts Frida Kahlo paintings correctly from the mock HTML file' do
    expected = [
      {
        name: "The Two Fridas",
        extensions: ["1939"],
        link: "https://www.google.com/path/to/two-fridas",
        image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/frida1"
      },
      {
        name: "Self-Portrait with Thorn Necklace and Hummingbird",
        extensions: ["1940"],
        link: "https://www.google.com/path/to/self-portrait-thorn-necklace",
        image: "data:image/jpeg;base64,/9j/4fasdQSkZJRgABAQAAAQABAAD/frida2"
      },
      {
        name: "The Broken Column",
        extensions: ["1944"],
        link: "https://www.google.com/path/to/broken-column",
        image: "data:image/jpeg;base64,/9j/4Aasdfasdfasdfasdfasdfads/frida3"
      },
      {
        name: "The Wounded Deer",
        extensions: ["1946"],
        link: "https://www.google.com/path/to/wounded-deer",
        image: "data:image/jpeg;base64,/9j/fasdfasdfasdfADSDADAAD/frida4"
      }
    ]
    result = extract_painting_data('spec/test_kahlo_paintings.html')
    expect(result).to eq(expected)
  end

  it 'extracts Pablo Picasso paintings correctly from the mock HTML file' do
    expected = [
      {
        name: "Les Demoiselles d'Avignon",
        extensions: ["1907"],
        link: "https://www.google.com/path/to/les-demoiselles",
        image: "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/picasso1"
      },
      {
        name: "Guernica",
        extensions: ["1937"],
        link: "https://www.google.com/path/to/guernica",
        image: "data:image/jpeg;base64,/9j/4fasdQSkZJRgABAQAAAQABAAD/picasso2"
      },
      {
        name: "The Weeping Woman",
        extensions: ["1937"],
        link: "https://www.google.com/path/to/weeping-woman",
        image: "data:image/jpeg;base64,/9j/4Aasdfasdfasdfasdfasdfads/picasso3"
      },
      {
        name: "Girl Before a Mirror",
        extensions: ["1932"],
        link: "https://www.google.com/path/to/girl-mirror",
        image: "data:image/jpeg;base64,/9j/fasdfasdfasdfADSDADAAD/picasso4"
      }
    ]
    result = extract_painting_data('spec/test_picasso_paintings.html')
    expect(result).to eq(expected)
  end
end