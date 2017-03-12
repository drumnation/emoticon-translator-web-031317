require 'yaml'

def load_library(filedir)
  emoticons = YAML.load_file(filedir)
  emoticons_hash = { "get_emoticon" => {}, "get_meaning" => {} }
  emoticons.each do |name, emoticon|
    emoticons_hash["get_meaning"][emoticon[1]] = name
    emoticons_hash["get_emoticon"][emoticon[0]] = emoticon[1]
  end
  emoticons_hash
end

def get_japanese_emoticon(filedir, emoticon)
  emhash = load_library(filedir)
  return emhash["get_emoticon"][emoticon].nil? ? "Sorry, that emoticon was not found" : emhash["get_emoticon"][emoticon]
end

def get_english_meaning(filedir, emoticon)
  emhash = load_library(filedir)
  return emhash["get_meaning"][emoticon].nil? ? "Sorry, that emoticon was not found" : emhash["get_meaning"][emoticon]
end
