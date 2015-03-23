require 'ooor'

describe 'Instruction' do

  let(:instruction) { ooor.const_get('iqc.inspection.instruction') }

  let(:ooor) {
    Ooor.new(:url => @url, :username => @username, :password => @password, :database => @database)
  }

  before(:each) do
    @url = 'http://localhost:8069/xmlrpc'
    # @url = 'http://192.168.2.191:8069/xmlrpc'
    # @db_password = 'admin'
    @username = 'admin'
    @password = 'admin'
    @database = 'bhs-development'
    # @database = 'bhs_development'
  end

  describe '#to_dict' do

    before(:each) do
     @instruction = instruction.find(:first).to_dict()
    end

    it 'return a dict' do
      expect(@instruction[0].keys).to be_include('name')
      expect(@instruction[0].keys).to be_include('file')
    end
  end

end