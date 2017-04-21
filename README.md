# Facebook Cover Resize

[![Build Status](https://travis-ci.org/gbarillot/facebook_cover_resize.png)](https://travis-ci.org/gbarillot/facebook_cover_resize)

This Ruby Gem let you display and resize both Facebook events and accounts cover images according to offset_x / offset_y provided by Facebook Graph API. Using this Gem, you can display cover images exactly as they are on Facebook.

To use this Gem, you have to grab 3 parameters from Facebook API:

* offset_x (positive integer)
* offset_y (positive integer)
* cover source (the URL of the image)

Aside from these data provided by Facebook, you'll also need the dimensions of the image itself.
Personally I use the [Fastimage](https://github.com/sdsykes/fastimage) Gem for this
and it's working perfectly fine.

## Installation

Add this line to your Gemfile:

```ruby
gem 'facebook_cover_resize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facebook_cover_resize

## Usage

This Gem contains an algorithm for image size computations, and some Rails view helpers. Using the view helpers
to display and resize an event cover is as simple as:

```ruby
- @event = Event.find(123)
# @event.cover: String (raw URL)
# @event.original: Array, containing 2 positive integers
# @event.offsets: Array, containing 2 integers

= event_cover_tag source: @event.cover, original: @event.cover_size, offsets: @event.offsets, width: 500
```

If you want to display an account cover:

```ruby
- @account = Account.find(123)

= account_cover_tag source: @account.cover, original: @account.cover_size, offsets: @account.offsets, width: 500
```

*Note:* This Gem handles resizing, but you MUST respect the original Facebook width/height ratios,
which is 1.91 (500/262) for events, and 2.66 (829/312) for an account cover. That's why you only have to set the new width for your thumbnails, height being automatically computed.

### Life outside of the Rails

If you don't want to use Rails, you can however simply use the plain Algorithm:

```ruby
FacebookCoverResize.compute(
  original: [original_width, original_height],
  offsets: [offset_x, offset_y],
  width: width_you_want_for_final_display_in_pixels
  ratio: 1.91
)
```
This outputs an array containing 4 values :

```ruby
[
  offset_y,
  offset_x,
  image_width,
  image_height
]
```
You can then build a container, surrounding an img tag, using these values like this :

```html
<div
  style="
    width: 500px !important;       # Container width
    height: 262px !important;      # Container width / 1.91
    overflow: hidden !important;   
    position: relative !important;
    padding:0 !important
  ">
  <img
    style="
      position: absolute !important;
      top: 0px !important;        # offset_y
      left: 0px !important;       # offset_x
      width: 500px !important;    # image_width
      height:824px !important;    # image_height
      margin: 0 !important"
    src="FACEBOOK_URL/event_cover.jpg" # The cover source URL
  />
</div>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gbarillot/facebook_cover_resize.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
