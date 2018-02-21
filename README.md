# Parro test
ruby code test for parrolabs

You will find a 2 solutions inside this repo, one with the ruby-oop lib solution, and another one implemented in Ruby on Rails.
* [Ruby solution](#ruby-oop-solution)
* [Ruby on Rails solution](#ruby-on-rails-solution)

## Ruby OOP solution
This solution is in pure ruby, I wanted to show a way to solve this test using object-oriented programming giving the code the ability to grow and add new features easily.

### Prerequisites
In order to run this solution you need to install `Ruby >= 2`after that you need to download or clone this repository.
```
git clone git@github.com:katorres02/parro-test.git
```
Then go to `ruby-solution/lib` folder and run
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

After that go to `ruby-solution`folder and run
```
rake test
```

## Ruby on Rails solution
A RoR implementation of the first solution, there is a couple of things to see in this part.
* There is an initializer `config/initializers/checkout.rb` where the initial promotion rules are laoded
* There is method inside `ApplicationController` that creates an object from checkout class, It helps to reuse this method from all classes inherited from it
* There is an `Api/v1/`namespace in controllers to allows working with an api
* An ajax method in javascripts for real time calculation


### Prerequisites
In order to run this solution you need to install `Ruby >= 2` after that you need to download or clone this repository.
```
git clone git@github.com:katorres02/parro-test.git
```
Then go to `rails-solution` folder and install the gems
```
bundle install
```
Start the server
```
rails s
```

If you go to the browser `http://localhost:3000` you should see a shopping cart view with and input for each product then go ahead and change de number of each roduct and you should see how the final price is updated in real time according with the promotion rules.

![index example](https://lh4.googleusercontent.com/1br7H-weWu_qVm5RaJVPjXgtDeMwZdE4SXA1Dyw1QEkgmg_jI_VaHQCMB_83O2ZTIXLXSKiAkdKu0OkxT2iy=w1440-h724-rw)

### Running the tests
You should be placed inside `rails-solution` folder
```
bin/rails test test/lib/*_spec.rb
```

## Authors

* **Carlos Andres Torres Cruz** - *Ruby on Rails developer* - [katorres02](https://github.com/katorres02)


