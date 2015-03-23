require 'ooor'

describe 'Part' do

  let(:part) { ooor.const_get('iqc_base.part') }

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
     @part = part.find(:first).to_dict()
    end

    # no = fields.Char(string="No.", required=True, index=True)
    # name = fields.Char(string="Chinese Name")
    # name_en = fields.Char(string="English Name")
    # unit = fields.Char(string="Chinese Unit")
    # unit_en = fields.Char(string="English Unit")
    # machine = fields.Char(string="Machine")
    # remark = fields.Text(string="Remark")
    #
    # c1 = fields.Char(string="C1")
    # c2 = fields.Char(string="C2")
    # c3 = fields.Char(string="C3")
    # c4 = fields.Char(string="C4")

    it 'return a dict' do
      expect(@part[0].keys).to be_include('c1')
      expect(@part[0].keys).to be_include('c2')
      expect(@part[0].keys).to be_include('c3')
      expect(@part[0].keys).to be_include('c4')
      expect(@part[0].keys).to be_include('name')
      expect(@part[0].keys).to be_include('name_en')
      expect(@part[0].keys).to be_include('unit')
      expect(@part[0].keys).to be_include('unit_en')
      expect(@part[0].keys).to be_include('machine')
      expect(@part[0].keys).to be_include('remark')
      expect(@part[0].keys).to be_include('rule_id')
    end
  end

end