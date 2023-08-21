require_relative %(../src/lib/pangea_component/pangea_component)
require %(terraform-synthesizer)

TF = TerraformSynthesizer.new

describe %(component interface) do
  before do
    TF.synthesize do
      component(
        resource: :aws_vpc,
        name: %(test_vpc),
        properties: {
          cidr_block: %(10.0.0.0/16),
          tags: { Name: %(test_vpc) }
        }
      )

      output :vpc_id do
        value :test_vpc
        description %(The ID of the VPC)
      end
    end
  end

  it %(returns a Hash) do
    expect(TF.synthesis).to be_kind_of(Hash)
  end
end
