# Facebook Cover Resize

[![Build Status](https://travis-ci.org/gbarillot/facebook_cover_resize.png)](https://travis-ci.org/gbarillot/facebook_cover_resize)

This Gem allows to display and resize Facebook events' cover image according to offset_x / offset_y
provided by the Facebook Graph API. Using this Gem, you can display event cover image exactly like how they look like on Facebook, no distortions, no more poor cropping.

To use this Gem, you have to grab 3 parameters from Facebook's API:

* offset_x (positive integer)
* offset_y (positive integer)
* cover source (the URL of the image)

WARNING: aside from these data provided by Facebook, you'll also need the dimensions of the image itself!
Personally I use the [Fastimage](https://github.com/sdsykes/fastimage) Gem for this
and it's working perfectly fine.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facebook_cover_resize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facebook_cover_resize

## Usage

This Gem contains an algorithm for image size computations, and a Rails view helper. Using the view helper
is as simple as :

```ruby
- @event = Event.find(123)
= event_cover_tag source: @event.cover, original: @event.cover_size, offsets: @event.offsets, width: 500
```

*Note:* Although this Gem handles resizing, you MUST respect the original Facebook width/height ratio,
which is 1.91 (500/262). That's why you can only set the new width for your thumbnails,
height is then automatically computed.

*Example:* Let's say you need to display your thumbnails in a 250px wide container. You only have to
call the Gem using this width, height being automatically set to 250 / 1.91 = 131px

### Life outside of Rails

If you don't want to use Rails, you can however just use the plain Algorithm:

```ruby
FacebookCoverResize.compute(
  original: [original_width, original_height],
  offsets: [offset_x, offset_y],
  width: width_you_want_for_final_display_in_pixels
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
