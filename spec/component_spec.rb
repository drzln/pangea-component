require_relative %(../src/lib/pangea-component/pangea-component)
require %(terraform-synthesizer)

describe %(component interface) do
  TF = TerraformSynthesizer.new
  it %(returns a Hash) do
    TF.synthesize do
      results = component(
        resource: :aws_vpc, 
        name: %(test_vpc),
        properties: {
          cidr_block: %(10.0.0.0/16),
          tags: Name: %(test_vpc)
        }
      )
      expect(component).to be_kind_of(Hash)
    end
  end
end
