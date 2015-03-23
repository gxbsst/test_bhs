require 'ooor'

describe 'Batch' do

  let(:batch) { ooor.const_get('iqc_base.batch') }

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
     @batch = batch.find(:first).to_one_dict()
    end

    # name = fields.Char(string="Name", compute='_compute_name')
    #
    # uuid = fields.Char(string="UUID", index=True, default=lambda *args: '%s' % uuid.uuid4())
    #
    # order_no = fields.Char(string="Order No.")
    # pos = fields.Char(string="POS")
    # supplier_no = fields.Char(string="Supplier No.")
    # arrival_date = fields.Char(string="Arrival Date")
    # part_no = fields.Char(string="Part No.")
    # quantity = fields.Integer(string="Quantity")
    #
    # work_no = fields.Integer(string="Work No.")
    #
    # part_id = fields.Many2one("iqc_base.part", "Part")
    # supplier_id = fields.Many2one("iqc_base.supplier", "Supplier")
    #
    # inspection_quantity = fields.Integer(string="Inspection Quantity", compute='_compute_inspection_quantity')
    # ok_quantity = fields.Integer(string="OK Quantity")
    # ng_quantity = fields.Integer(string="NG Quantity")
    # inspection_datetime = fields.Datetime(string="Inspection Datetime")
    #
    # inspector_id = fields.Many2one("iqc_base.inspector", "Inspector")
    #
    # package_ids = fields.One2many("iqc_base.package", "batch_id", string="Related Packages")
    #
    # is_urgent = fields.Boolean(string="Is Urgent?")


    it 'return a dict' do
      expect(@batch[0].keys).to be_include('id')
      expect(@batch[0].keys).to be_include('name')
      expect(@batch[0].keys).to be_include('uuid')
      expect(@batch[0].keys).to be_include('order_no')
      expect(@batch[0].keys).to be_include('pos')
      expect(@batch[0].keys).to be_include('supplier_no')
      expect(@batch[0].keys).to be_include('arrival_date')
      expect(@batch[0].keys).to be_include('part_no')
      expect(@batch[0].keys).to be_include('quantity')
      expect(@batch[0].keys).to be_include('work_no')
      expect(@batch[0].keys).to be_include('inspection_quantity')
      expect(@batch[0].keys).to be_include('ok_quantity')
      expect(@batch[0].keys).to be_include('ng_quantity')
      expect(@batch[0].keys).to be_include('inspection_datetime')
      expect(@batch[0].keys).to be_include('is_urgent')
    end
  end

end