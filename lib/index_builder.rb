require 'json'

class IndexBuilder
  STOPWORDS = %w(a an and are as at be but by for if in into is) +
              %w(it no not of on or s such t that the their then) +
              %w(there these they this to was will with) +
              %w(class method return end if else)

  def initialize(pages)
    @pages = pages
  end

  def pages_index
    @pages.inject([]) { |h, p|
      h << {
        :title => p.to_s,
        :url => p.path,
        :type => p.data['group'],
        :parent => (urls.index(p.parent.path) if p.parent?) }
      h
    }
  end

  def urls
    @urls ||= @pages.map { |p| p.path }
  end

  def search_index
    # Build a search index (hash of hashes of words and page indices)
    search_index = Hash.new { |hash, k| hash[k] = Hash.new { |hh, kk| hh[kk] = 0 } }

    @pages.each do |p|
      i = urls.index(p.path)

      if p.to_s.count(' ') > 0
        # Partial title match
        fuzzy_words(p).each { |word| search_index[word][i] += 30 }
      else
        # Exact title match
        fuzzy_words(p).each { |word| search_index[word][i] += 60 }
      end

      # Fuzzy title match
      fuzzy_words(p).each { |word| search_index[word][i] += 3 }

      # Content match
      fuzzy_words(p.content).each { |word| search_index[word][i] += 1 }
    end

    search_index
  end

  def indices
    {
      :pages => pages_index,
      :search => search_index
    }
  end

private

  # "Hello world" => ["hello", "world" ]
  def words(str)
    str.to_s.downcase.scan(/[A-Za-z0-9\_]+/)
  end

  # "hello" => ["he", "hel", "hell", "hello" ]
  def fuzzies(str)
    str = str.to_s.downcase; (1...str.size).map { |n| str[0..n] }
  end

  # "hello world" => ["he", "hel", "hell", "hello", "wo", "wor", "worl", "world" ]
  def fuzzy_words(str)
    words(str).map { |word| fuzzies(word)  if word.size > 2 and !STOPWORDS.include?(word) }.compact.flatten
  end

end
