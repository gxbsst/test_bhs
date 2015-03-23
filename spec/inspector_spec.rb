require 'ooor'

describe 'Instruction' do

  let(:inspector) { ooor.const_get('iqc_base.inspector') }

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
      @inspector = inspector.find(:first).to_dict()
    end

    it 'return a dict' do
      expect(@inspector[0].keys).to be_include('id')
      expect(@inspector[0].keys).to be_include('name')
    end
  end

end