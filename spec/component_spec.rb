require_relative %(../src/lib/pangea_component/pangea_component)
require %(terraform-synthesizer)

TF = TerraformSynthesizer.new

describe %(component interface) do
  it %(returns a Hash) do
    TF.synthesize do
      component(
        resource: :aws_vpc,
        name: %(test_vpc),
        properties: {
          cidr_block: %(10.0.0.0/16)
          # tags: { Name: %(test_vpc) }
        }
      )
    end
    expect(TF.synthesis).to be_kind_of(Hash)
  end
end
