class Catalog
    attr_accessor :id, :name
  
    def initialize(params = {})
      @id = params[:id]
      @name = params[:name]
    end
  
    def to_json(options = {})
      {
        idProductCatalog: @id,
        name: @name,
      }.to_json(options)
    end
  end
  