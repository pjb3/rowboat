# Rowboat

Rowboat always you to convert tabular data into an object graph.

## Installation

Add this line to your application's Gemfile:

    gem 'rowboat'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rowboat

## Usage

You initialize a Rowboat with tabular data. The first argument is an Array of column names and the second is an Array of Arrays, one Array for each row of data:

    rows = []
    rows << ["Paul", "mail@paulbarry.com"]
    rows << ["Test", "test@example.com"]
    rowboat = Rowboat.new(["name", "email"], rows)

Then you call `to_a` on the rowboat to get an Array of Hashes:

    >> rowboat.to_a
    => [
      {:name=>"Paul", :email=>"mail@paulbarry.com"}, 
      {:name=>"Test", :email=>"test@example.com"}
    ]

If you have a `.` in the name of a column, that will create a value of a Hash in each Hash for all columns that have the same prefix:



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
