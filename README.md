# Doing

### A simple command line per-project todo manager

Creates a `doing.markdown` file in your current directory. I use a file like this to quickly track tasks, I thought I'd like to have a more formal command line function for it. 

Move is broken currently. And it will not search super directories for the `doing.markdown` file yet, but those are all things I'm hoping to do. 

## Installation

gotta build it the old fashioned way, not available on rubygems yet

## Usage

```
doing create

doing add todo finish this app

doing move done finish this app

doing list

doing list done

doing remove finish this app
```

## Contributing

1. Fork it ( http://github.com/camray/doing/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
