# ToRupees
Spell out numbers in indian currency. It converts numbers in words(rupees).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_rupees'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_rupees

## Usage

```ruby
12.to_rupees
 => "Twelve Rupees"

12.23.to_rupees
 => "Twelve Rupees and Twenty Three Paisa"

123534.to_rupees
 => "One Lakh , Twenty Three Thousand , Five Hundred And Thirty Four Rupees"

"123534".to_rupees
 => "One Lakh , Twenty Three Thousand , Five Hundred And Thirty Four Rupees"

"123534.78400".to_rupees
 => "One Lakh , Twenty Three Thousand , Five Hundred And Thirty Four Rupees and Seventy Eight Paisa"

"123534.78900".to_rupees
 => "One Lakh , Twenty Three Thousand , Five Hundred And Thirty Four Rupees and Seventy Nine Paisa" 
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[vin-droid]/to_rupees.
1. Fork it ( https://github.com/vin-droid/to_rupees/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
