class Product
    attr_accessor :id, :name, :description, :enterprise
  
    def initialize(params = {})
      @id = params[:id] || nil
      @name = params[:name]
      @description = params[:description]
      @enterprise = params[:enterprise]
    end
  
    def to_json(options = {})
      {
        idProduct: @id,
        name: @name,
        description: @description,
        enterprise: @enterprise
      }.to_json(options)
    end
  end