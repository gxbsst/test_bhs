require 'ooor'

describe 'Rule' do

  let(:rule) { ooor.const_get('iqc.inspection.rule') }

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
     @rule = rule.find(:first).to_dict()
    end

    # name = fields.Char(string='Name')
    # part_id = fields.Many2one('iqc_base.part')
    # tool = fields.Char('Tool')
    # type = fields.Selection([('quantitative', 'quantitative'), ('qualitative', 'qualitative')])
    # standard = fields.Integer('Standard')
    # up = fields.Integer('Quantitative Up')
    # down = fields.Integer('Quantitative Down')
    # coord_x = fields.Float('Coord X')
    # coord_y = fields.Float('Coord Y')


    it 'return a dict' do
      expect(@rule[0].keys).to be_include('name')
      expect(@rule[0].keys).to be_include('tool')
      expect(@rule[0].keys).to be_include('type')
      expect(@rule[0].keys).to be_include('standard')
      expect(@rule[0].keys).to be_include('up')
      expect(@rule[0].keys).to be_include('down')
      expect(@rule[0].keys).to be_include('coord_x')
      expect(@rule[0].keys).to be_include('coord_y')
    end
  end

end