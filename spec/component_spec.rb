require_relative %(../src/lib/pangea_component/pangea_component)
require %(terraform-synthesizer)

TF = TerraformSynthesizer.new

describe %(component interface) do
  TF.synthesize do
    component(
      resource: :aws_vpc,
      name: %(test_vpc),
      properties: {
        cidr_block: %(10.0.0.0/16),
        tags: { Name: %(test_vpc) }
      }
    )
  end

  it %(returns a Hash) do
    expect(TF.synthesis).to be_kind_of(Hash)
  end

  it %(has correct property values) do
    expected = {
      cidr_block: %(10.0.0.0/16),
      tags: { Name: %(test_vpc) }
    }
    TF.synthesis[:resource].each_key do |resource_name|
      resource = TF.synthesis[:resource][resource_name]
      resource.each_key do |property_name|
        property_name   = property_name.to_sym
        property_value  = resource[property_name]
        expect(property_value).to eq(expected[property_name.to_sym])
      end
    end
  end
end
