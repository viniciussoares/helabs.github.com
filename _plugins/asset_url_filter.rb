module Jekyll
  module AssetUrlFilter
    def asset_url(path)
      # taken from https://github.com/ixti/jekyll-assets/blob/master/lib/jekyll/assets_plugin/filters.rb
      renderer = Jekyll::AssetsPlugin::Renderer.new @context, path
      asset_path = renderer.render_asset_path
      "#{origin}#{asset_path}"
    end

    private
      # dirty way to detect the current environment
      def env
        @env ||= if Jekyll.env == "development"
          Jekyll.env
        elsif File.read("CNAME").strip == "staging.helabs.com.br"
          "staging"
        else
          "production"
        end
      end

      def origin
        @origin ||= if env == "development"
          "http://localhost:4000"
        elsif env == "staging"
          "http://staging.helabs.com.br"
        elsif env == "production"
          "http://helabs.com.br"
        end
      end
  end
end

Liquid::Template.register_filter(Jekyll::AssetUrlFilter)
