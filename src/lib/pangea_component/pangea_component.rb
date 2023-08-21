require %(json)

def symbolize(hash)
  JSON[JSON[hash], symbolize_names: true]
end

def component(**kwargs)
  # ensure everything passed into component
  # is consistently keyed by symbols
  kwargs = symbolize(kwargs) unless kwargs.nil?

  # perform any sort of validation on passed in
  # component data
  # raise "args support not implemented yet" if args.any?
  # raise "kwargs must be present" unless kwargs.any?
  # raise "component name not specified" unless kwargs[:name]
  # raise "#{kwargs[:name]} has no properties" unless kwargs[:properties]

  resource_name = kwargs.fetch(:resource, nil)
  virtual_name  = kwargs.fetch(:name, nil)
  properties    = kwargs.fetch(:properties, {})

  # resource call which triggers compilation
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
