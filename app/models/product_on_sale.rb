require 'pg'
require 'date'
require_relative 'enterprise'
require_relative 'product'
require_relative 'catalog'

class ProductOnSale
  attr_accessor :id, :title, :product, :catalog, :price, :sale_start_datetime, :sale_end_datetime

  def initialize(params = {})
    @id = params[:id]
    @title = params[:title]
    @product = params[:product]
    @catalog = params[:catalog]
    @price = params[:price]
    @sale_start_datetime = params[:sale_start_datetime]
    @sale_end_datetime = params[:sale_end_datetime]
  end

  def to_json(options = {})
    {
      idProductOnSale: @id,
      title: @title,
      product: @product,
      catalog: @catalog,
      price: @price,
      saleStartDatetime: @sale_start_datetime,
      saleEndDatetime: @sale_end_datetime
    }.to_json(options)
  end
end
