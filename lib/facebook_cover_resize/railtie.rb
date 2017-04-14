require 'facebook_cover_resize/view_helpers'
module FacebookCoverResize
  class Railtie < Rails::Railtie
    initializer "facebook_cover_tags.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
