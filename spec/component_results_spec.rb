require_relative %(../src/lib/pangea_component/pangea_component)
require %(terraform-synthesizer)

describe %(component interface) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  before do
    tf.synthesize do
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
    expect(tf.synthesis).to be_kind_of(Hash)
  end
end
