# product_on_sale_repository.rb

require 'pg'
require_relative '../models/enterprise'
require_relative '../models/product'
require_relative '../models/catalog'

class ProductOnSaleRepository
    def self.get_product_on_sale_by_id(id)
        DB.with do |conn|
          result = conn.exec_params('
          SELECT 
              fpos.id_product_on_sale, 
              fpos.title, 
              fpos.price, 
              fpos.creation_datetime, 
              fpos.sale_start_datetime, 
              fpos.sale_end_datetime, 
              dp.id_product, 
              dp.name AS product_name, 
              dp.description AS product_description, 
              de.id_enterprise, 
              de.name AS enterprise_name, 
              dpc.id_product_catalog, 
              dpc.name AS catalog_name
            FROM 
              commerce.fact_product_on_sale fpos 
            INNER JOIN 
              commerce.dim_product dp ON fpos.id_product = dp.id_product
            INNER JOIN 
              commerce.dim_enterprise de ON dp.id_enterprise = de.id_enterprise
            INNER JOIN 
              commerce.dim_product_catalog dpc ON fpos.id_product_catalog = dpc.id_product_catalog
            WHERE 
              fpos.id_product_on_sale = $1', [id])
          parse_result(result.first)
        end
    end

  private
  def self.parse_result(result)
    return nil unless result

    enterprise = Enterprise.new(id: result['id_enterprise'], name: result['enterprise_name'])
    product = Product.new(id: result['id_product'], name: result['product_name'], description: result['product_description'], enterprise: enterprise)
    catalog = Catalog.new(id: result['id_product_catalog'], name: result['catalog_name'])

    ProductOnSale.new(
      id: result['id_product_on_sale'],
      title: result['title'],
      product: product,
      catalog: catalog,
      price: result['price'],
      sale_start_datetime: result['sale_start_datetime'],
      sale_end_datetime: result['sale_end_datetime']
    )
  end
end
