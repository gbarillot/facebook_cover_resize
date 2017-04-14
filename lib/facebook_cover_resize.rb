require "facebook_cover_resize/version"
require 'facebook_cover_resize/railtie' if defined?(Rails)

module FacebookCoverResize
  def self.compute(args)
    ow = args[:width].to_f
    oh = (ow / 1.91)

    if args[:original].any? && args[:offsets].any?
      nw = args[:original].first.to_f
      nh = args[:original].last.to_f
      ox = args[:offsets].first.to_f
      oy = args[:offsets].last.to_f

      if ox == 0 && oy == 0
        w = ow
        h = nh * (ow / nw)
        if h < oh
          h = oh
          w = nw * (oh / nh)
          offset_x = ow - w
          offset_y = 0
        else
          offset_x = 0
          if w < h
            offset_y = 0
          else
            offset_y = oh - h
          end
        end
      else
        if oy > 0
          w = ow
          h = nh * (ow / nw)
          offset_x = 0
          offset_y = (oh - h) * (oy / 100.0)
          if h < oh
            h = oh
            w = nw * (oh / nh)
            offset_x = (ow - w) / 2
            offset_y = 0
          end
        elsif ox > 0
          h = oh
          w = nw * (oh / nh)
          offset_x = (ow - w) / 2
          offset_y = 0
        else
          w = ow
          h = nh * (ow / nw)
          offset_x = 0
          offset_y = 0
        end
      end
    else
      w = ow
      h = oh
      offset_x = 0
      offset_y = 0
    end

    # [top, left, width, height]
    out = [
      offset_y.ceil,
      offset_x.ceil,
      w.ceil,
      h.ceil
    ]

    return out
  end
end
