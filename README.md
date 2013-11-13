# sigma_form

A simple `#yesno` element dropdown box abstraction for boolean yes or no
dropdown for the [Nitrogen Web Framework](http://nitrogenoproject.com)

## Installing into a Nitrogen Application

Add it as a rebar dependency by adding into the deps section of rebar.config:

```erlang
	{sigma_yesno, ".*", {git, "git://github.com/choptastic/sigma_yesno.git", {branch, master}}}
```

### Using Nitrogen's built-in plugin installer (Requires Nitrogen 2.2.0)

Run `make` in your Application. The rest should be automatic.

### Manual Installation (Nitrogen Pre-2.2.0)

Run the following at the command line:

```shell
	./rebar get-deps
	./rebar compile
```

Then add the following includes into any module requiring the form

```erlang
	-include_lib("sigma_form/include/records.hrl").
```

## Usage

```erlang
	#sigma_yesno{
		yes_text="Yeah, Sure",
		no_text="Heck No",
		value=AreYouAwesome
	}
```

+ `yes_text`: The text for the "Yes" value
+ `no_text`: The text for the "No" value
+ `value`: The boolean value to determine which value is selected. Please note
  that this follows a somewhat "PHP-ish" approach. The following values
  evaluate to false: `false`, `"false"`, `"no"`, `no`, `"0"`, `0`, `""`
  (empty list), and `undefined`.  All others evaluate to true.

As far as postback values, the "yes" value will be the text "1", and the "no"
value will be text "0".

## License

Copyright (c) 2013, [Jesse Gumm](http://sigma-star.com/page/jesse)
([@jessegumm](http://twitter.com/jessegumm))

MIT License
