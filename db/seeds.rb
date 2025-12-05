QuizAttemptScore.delete_all
QuizAttempt.delete_all
Flashcard.delete_all
Deck.delete_all

puts "Seeding decks and flashcards..."

topics = {
  "Array Methods" => [
    ["How do you add an element to the end of an array?", "Use array.push(element)"],
    ["How do you remove the last element of an array?", "Use array.pop"],
    ["How do you get the first element?", "array.first"],
    ["How do you get the last element?", "array.last"],
    ["How do you combine two arrays?", "array1 + array2 or array1.concat(array2)"],
    ["How do you iterate through an array?", "array.each { |el| ... }"],
    ["How do you get unique elements?", "array.uniq"],
    ["How do you flatten nested arrays?", "array.flatten"],
    ["How do you sort an array?", "array.sort"],
    ["How do you reverse an array?", "array.reverse"]
  ],

  "Hash Methods" => [
    ["How do you get a value for a key?", "hash[key]"],
    ["How do you set a value for a key?", "hash[key] = value"],
    ["How do you get all keys?", "hash.keys"],
    ["How do you get all values?", "hash.values"],
    ["How do you delete a key?", "hash.delete(key)"],
    ["How do you check if key exists?", "hash.key?(key)"],
    ["How do you merge two hashes?", "hash1.merge(hash2)"],
    ["How do you iterate over a hash?", "hash.each { |k,v| ... }"],
    ["How do you invert a hash?", "hash.invert"],
    ["How do you select certain keys?", "hash.select { |k,v| ... }"]
  ],

  "String Methods" => [
    ["How do you get the length of a string?", "string.length"],
    ["How do you uppercase a string?", "string.upcase"],
    ["How do you lowercase a string?", "string.downcase"],
    ["How do you capitalize a string?", "string.capitalize"],
    ["How do you reverse a string?", "string.reverse"],
    ["How do you check if a string includes a substring?", "string.include?('substring')"],
    ["How do you split a string by spaces?", "string.split(' ')"],
    ["How do you strip whitespace?", "string.strip"],
    ["How do you replace text?", "string.gsub('old', 'new')"],
    ["How do you interpolate variables?", '"Hello #{name}"']
  ],

  "Enumerable Methods" => [
    ["How do you map an array?", "array.map { |el| ... }"],
    ["How do you select elements?", "array.select { |el| ... }"],
    ["How do you reject elements?", "array.reject { |el| ... }"],
    ["How do you reduce an array?", "array.reduce(initial) { |acc, el| ... }"],
    ["How do you find an element?", "array.find { |el| ... }"],
    ["How do you check all elements satisfy condition?", "array.all? { |el| ... }"],
    ["How do you check any element satisfies condition?", "array.any? { |el| ... }"],
    ["How do you count elements?", "array.count { |el| ... }"],
    ["How do you sort by a block?", "array.sort_by { |el| ... }"],
    ["How do you group elements?", "array.group_by { |el| ... }"]
  ],

  "Regexp Methods" => [
    ["How do you match a regex?", "string.match(/pattern/)"],
    ["How do you scan all matches?", "string.scan(/pattern/)"],
    ["How do you replace using regex?", "string.gsub(/pattern/, 'replacement')"],
    ["How do you split by regex?", "string.split(/pattern/)"],
    ["How do you check if regex matches?", "/pattern/ =~ string"],
    ["How do you use case-insensitive regex?", "/pattern/i"],
    ["How do you get captures?", "match_data.captures"],
    ["How do you use named captures?", "/(?<name>pattern)/"],
    ["How do you match beginning of string?", "/^pattern/"],
    ["How do you match end of string?", "/pattern$/"]
  ],

  "File Methods" => [
    ["How do you read a file?", "File.read('file.txt')"],
    ["How do you write to a file?", "File.write('file.txt', content)"],
    ["How do you append to a file?", "File.open('file.txt', 'a') { |f| f.write(content) }"],
    ["How do you check if file exists?", "File.exist?('file.txt')"],
    ["How do you delete a file?", "File.delete('file.txt')"],
    ["How do you get file size?", "File.size('file.txt')"],
    ["How do you read lines?", "File.readlines('file.txt')"],
    ["How do you rename a file?", "File.rename('old.txt','new.txt')"],
    ["How do you copy a file?", "FileUtils.cp('src','dest')"],
    ["How do you move a file?", "FileUtils.mv('src','dest')"]
  ],

  "Time & Date Methods" => [
    ["How do you get current time?", "Time.now"],
    ["How do you get current date?", "Date.today"],
    ["How do you format time?", "time.strftime('%Y-%m-%d')"],
    ["How do you add days?", "time + 60*60*24*days"],
    ["How do you subtract days?", "time - 60*60*24*days"],
    ["How do you compare times?", "time1 > time2"],
    ["How do you parse a string to time?", "Time.parse('2025-01-01')"],
    ["How do you get year?", "time.year"],
    ["How do you get month?", "time.month"],
    ["How do you get day?", "time.day"]
  ],

  "Classes & Objects" => [
    ["How do you define a class?", "class MyClass; end"],
    ["How do you create a new object?", "obj = MyClass.new"],
    ["How do you define a method?", "def method_name; end"],
    ["How do you define an initializer?", "def initialize(args); end"],
    ["How do you inherit from a class?", "class Sub < Parent; end"],
    ["How do you call a method on an object?", "obj.method_name"],
    ["How do you check object class?", "obj.class"],
    ["How do you check if object responds to method?", "obj.respond_to?(:method_name)"],
    ["How do you convert object to string?", "obj.to_s"],
    ["How do you inspect an object?", "obj.inspect"]
  ],

  "Modules & Mixins" => [
    ["How do you define a module?", "module MyModule; end"],
    ["How do you include a module?", "class MyClass; include MyModule; end"],
    ["How do you extend a module?", "class MyClass; extend MyModule; end"],
    ["How do you use constants?", "MyModule::CONSTANT"],
    ["How do you prepend a module?", "class MyClass; prepend MyModule; end"],
    ["How do you check ancestors?", "MyClass.ancestors"],
    ["How do you check if module included?", "MyClass.include?(MyModule)"],
    ["How do you define module methods?", "def self.method_name; end"],
    ["How do you alias a method?", "alias new_name old_name"]
  ],

  "Error Handling" => [
    ["How do you handle exceptions?", "begin ... rescue ... end"],
    ["How do you raise an exception?", "raise 'message'"],
    ["How do you get exception message?", "e.message"],
    ["How do you retry a block?", "retry"],
    ["How do you ensure a block runs?", "ensure ... end"],
    ["How do you define custom exception?", "class MyError < StandardError; end"],
    ["How do you rescue multiple exceptions?", "rescue IOError, ArgumentError => e"],
    ["How do you log exception?", "puts e.backtrace"],
    ["How do you use else with rescue?", "else ... end"],
    ["How do you propagate exception?", "raise e"]
  ]
}

topics.each do |deck_name, cards|
  deck = Deck.create!(name: deck_name, description: "Flashcards for #{deck_name}")
  cards.each do |front, back|
    deck.flashcards.create!(front: front, back: back)
  end
end

puts "Seeding complete!"
