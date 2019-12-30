class CollectionToHeadings

  def initialize(collection)
    @collection = collection
    @headings_count = []
  end

  def print
    @collection.each do |row|
      #define string with heading numbering and title
      string = "#{heading_numering(row[:heading_level])}. #{row[:title]}\n"

      #add indentation at the beginning and print the string
      printf string.rjust(indent_level(string, row))  
    end
  end

  private

  def heading_numering(heading_level)
    #increment the count of headings on the current heading level
    @headings_count[heading_level] = @headings_count[heading_level].to_i + 1

    #replace nils with 1s
    @headings_count = @headings_count.map { |count| count ? count : 1 }

    #return string for the current heading level
    @headings_count.first(heading_level + 1).join('.')
  end

  def indent_level(string, row)
    #returns the size of indentation as an intiger
    string.length + (row[:heading_level] * 5)
  end
end

COLLECTION_1 = [
  { id: 1, title: "heading1", heading_level: 0 }, 
  { id: 2, title: "heading2", heading_level: 2 }, 
  { id: 3, title: "heading3", heading_level: 1 }, 
  { id: 4, title: "heading4", heading_level: 1 } 
]

COLLECTION_2 = [
  { id: 1, title: "heading1", heading_level: 0 }, 
  { id: 2, title: "heading2", heading_level: 3 }, 
  { id: 3, title: "heading3", heading_level: 4 }, 
  { id: 4, title: "heading4", heading_level: 1 }, 
  { id: 5, title: "heading5", heading_level: 0 }
]

COLLECTION_3 = [
  { id: 1, title: "heading1", heading_level: 0 }, 
  { id: 2, title: "heading2", heading_level: 1 }, 
  { id: 3, title: "heading3", heading_level: 0 }, 
  { id: 4, title: "heading4", heading_level: 1 }, 
  { id: 5, title: "heading5", heading_level: 2 },
  { id: 6, title: "heading6", heading_level: 1 }
]

p "Test Collection 1"
CollectionToHeadings.new(COLLECTION_1).print
p "Test Collection 2"
CollectionToHeadings.new(COLLECTION_2).print
p "Test Collection 3"
CollectionToHeadings.new(COLLECTION_3).print