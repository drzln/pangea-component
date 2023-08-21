require_relative %(../src/lib/pangea_component/pangea_component)
require %(terraform-synthesizer)

describe %(component interface) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  before do
    tf.synthesize do
      results = component(
        resource: :aws_vpc,
        name: %(test_vpc),
        properties: {
          cidr_block: %(10.0.0.0/16),
          tags: { Name: %(test_vpc) }
        }
      )

      results[:inputs].each_key do |k|
        output k do
          value results[:inputs][k]
          description %(The input #{k})
        end
      end
    end
  end

  it %(returns a Hash) do
    expect(tf.synthesis).to be_kind_of(Hash)
  end
end
