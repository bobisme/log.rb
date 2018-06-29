# log.rb

A minimal, opinionated logging class.

-   Only output format is JSON because it's a simple, readable format that log
    parsers love. Pipe your logs into [jq](https://stedolan.github.io/jq/) for
    something nice. `logs | jq .`
-   It only has one global instance because who cares.
-   It's not a gem because I don't care; Copy and paste it into your file.

Usage:

### Basic

```ruby
Log.info('hello')
```
```
{"level":"info","msg":"hello","at":"2018-06-29T04:22:46.106052Z"}
```

### Error levels.

```ruby
Log.error('oops', more: 'fields')
```
```
{"more":"fields","level":"error","msg":"oops","at":"2018-06-29T04:22:46.106108Z"}
```

### Change where the output goes (STDOUT by default).

```ruby
> Log.file = STDERR
> Log.error('oops', more: 'fields')
```
