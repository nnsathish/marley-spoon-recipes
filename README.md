# Marley Spoon Recipes

A simple Rails web application that uses Contentful API to list information
about recipes

### System dependencies
* Ruby - 2.6.3
* Bundler - 2.0.1

### Configuration
```bash
$ git clone https://github.com/nnsathish/marley-spoon-recipes.git
$ cd marley-spoon-recipes
```
Install rails and dependencies
```bash
$ bundle
```
Setup the master key for rails credentails
```bash
$ echo "818da225522489a714c2c2a684692cfa" >> config/master.key
```

Start the server
```bash
$ rails s
```

Launch the browser and hit [http://localhost:3000](http://localhost:3000)

### Run Test cases
```bash
$ rake
```

## TODOs
 - Support for pagination, if recipes are more than 100
 - Cache data retrived in listing and reuse it for detail view
 - Add test cases
