require %(json)

def symbolize(hash)
  JSON[JSON[hash], symbolize_names: true]
end

def component(**kwargs)
  kwargs        = symbolize(kwargs) unless kwargs.nil?
  resource_name = kwargs.fetch(:resource, nil)
  virtual_name  = kwargs.fetch(:name, nil)
  properties    = kwargs.fetch(:properties, {})

  resource(resource_name, virtual_name) do
    properties.each_key do |method|
      args = kwargs.dig(:properties, pn)
      send(method, args)
    end
  end

  outputs = {}
  outputs[:inputs] = kwargs

  outputs
end