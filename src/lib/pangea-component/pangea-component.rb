require %(json)

def symbolize(hash)
  JSON[JSON[hash], symbolize_names: true]
end

def component(**kwargs)

  # ensure everything passed into component
  # is consistently keyed by symbols
  kwargs  = symbolize(kwargs) unless kwargs.nil?
  # args    = symbolize(args) unless args.nil?

  # perform any sort of validation on passed in
  # component data
  # raise "args support not implemented yet" if args.any?
  # raise "kwargs must be present" unless kwargs.any?
  # raise "component name not specified" unless kwargs[:name]
  # raise "#{kwargs[:name]} has no properties" unless kwargs[:properties]

  # resource call which triggers compilation
  resource(kwargs[:resource], kwargs[:name]) do
    kwargs[:properties].each_key do |pn|
      send(pn, kwargs[:properties][pn])
    end
  end

  outputs = {}
  outputs[:inputs] = kwargs

  outputs
end
