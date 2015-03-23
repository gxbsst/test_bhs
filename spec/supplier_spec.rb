require 'ooor'

describe 'Supplier' do

  let(:supplier) { ooor.const_get('iqc_base.supplier') }

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
     @supplier = supplier.find(:first).to_dict()
    end

    # no = fields.Char(string="No.", required=True, index=True)
    # name = fields.Char(string="Name")


    it 'return a dict' do
      expect(@supplier[0].keys).to be_include('no')
      expect(@supplier[0].keys).to be_include('name')
    end
  end

end