# frozen_string_literal: true

module Products
  class Factory < ApplicationService
    attr_reader :params

    def initialize(params = {})
      @params = params
    end

    def call
      ActiveRecord::Base.transaction do
        product = Product.find_or_create_by(product_attributes)

        @article = product.create_product_article product_article_attributes

        @article.product_photos = product_photos

        @article.product_sizes = product_sizes

        @article.related_articles = related_articles if params[:related_sku]

        product.save
      end
    end

    private

    def product_attributes
      {
        sku: params[:product_sku],
        name: params[:product_name]
      }
    end

    def product_article_attributes
      {
        name: params[:article_name],
        sku: params[:article_sku],
        url: params[:url],
        price: params[:price].delete('$')
      }
    end

    def photos
      params[:photos]
    end

    def sizes
      params[:sizes]
    end

    def related_articles
      params[:related_sku].map do |r|
        pa = ProductArticle.find_by(sku: r)

        raise "Cant find related article with sku: #{r}" unless pa

        RelatedArticle
          .find_or_create_by(original_article: @article,
                             related_article: pa)
      end
    end

    def product_photos
      photos.map do |p|
        ProductPhoto.find_or_create_by(url: p[:url])
      end
    end

    def product_sizes
      sizes.map do |s|
        size = Size.find_or_create_by name: s[:name]

        ProductSize.find_or_create_by(sku: s[:size_sku]) do |ps|
          ps.size = size

          ps.available = s[:available]
        end
      end
    end
  end
end