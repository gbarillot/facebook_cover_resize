module FacebookCoverResize
  module ViewHelpers
    def event_cover_tag(args)
      dims = FacebookCoverResize.compute(original: args[:original], offsets: args[:offsets], width: args[:width])
      width = args[:width].to_i
      height = (width / 1.91).ceil
      source = args[:source]

      content_tag(:div,
        image_tag(source,
          style: "position: absolute !important;top: #{dims[0]}px !important;left: #{dims[1]}px !important;width: #{dims[2]}px !important;height:#{dims[3]}px !important; margin: 0 !important"
        ),
        style: "width: #{width}px !important; height: #{height}px !important; overflow: hidden !important;position: relative !important; padding:0 !important"
      )
    end

  end
end
