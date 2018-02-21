# Parro test
ruby code test for parrolabs

You will find a 2 folders inside this repo, one with the ruby-oop lib solution, and another one with the implemented library  in Ruby on Rails.

## Ruby OOP solution
This solution is in pure ruby, I wanted to show a way to solve this test using object-oriented programming giving the code the ability to grow and add new features easily.

### Prerequisites
In order to run this solution you need to install `Ruby >= 2`after that you need to download or clone this repository.
```
git clone git@github.com:katorres02/parro-test.git
```
Then go to `ruby-module/lib` folder and run
```
irb -r./main.rb
```
That will open an interactive ruby shell(IRB) with the classes loaded in it. The ouput of this console should be something like this
```
Items: VOUCHER, TSHIRT, MUG
32.5 €
Items: VOUCHER, TSHIRT, VOUCHER
25.0 €
Items: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT
81.0 €
Items: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT
74.5 €
```

Also a couple of checkout scenarios are loaded in that console you can access to them using this variables `@co, @co1, @co2, @co3, @co4`

### Running the tests
You need to install [Minitest](https://github.com/seattlerb/minitest) in order to run the specs for this solution

```
gem install minitest
```

After that go to `ruby-module`folder and run
```
rake test
```


## Authors

* **Carlos Andres Torres Cruz** - *Ruby on Rails developer* - [katorres02](https://github.com/katorres02)


