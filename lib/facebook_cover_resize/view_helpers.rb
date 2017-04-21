module FacebookCoverResize
  module ViewHelpers
    def event_cover_tag(args)
      tag_generator(args.update(ratio: 1.91))
    end

    def account_cover_tag(args)
      tag_generator(args.update(ratio: 2.66))
    end

    def tag_generator(args)
      dims = FacebookCoverResize.compute(original: args[:original], offsets: args[:offsets], width: args[:width], ratio: args[:ratio])
      width = args[:width].to_i
      height = (width / args[:ratio]).ceil
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
