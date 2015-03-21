require 'ooor'

describe 'App' do

  let(:app) { ooor.const_get('iqc.inspection.app')}
  let(:ncr) { ooor.const_get('iqc.inspection.ncr')}
  let(:batch) { ooor.const_get('iqc_base.batch') }
  let(:part) { ooor.const_get('iqc_base.part') }
  let(:supplier) { ooor.const_get('iqc_base.supplier') }

  let(:ooor) {
    Ooor.new(:url => @url, :username => @username, :password => @password, :database => @database)
  }

  before(:each) do
    # @url = 'http://localhost:8069/xmlrpc'
    @url = 'http://192.168.2.191:8069/xmlrpc'
    # @db_password = 'admin'
    @username = 'admin'
    @password = 'admin'
    # @database = 'bhs-development'
    @database = 'bhs_development'
  end

  describe 'iqc_base.batch' do
    describe '.find' do
      before(:each) do
       @batchs = app.query('iqc_base.batch', query: :all)
      end

      it 'return items' do
        # expect(ooor.models.keys).to be_include('iqc.inspection.app')
        expect(@batchs).to eq('.')
      end
    end

    describe '.do_create' do
     it 'create' do
      expect(app.do_create('iqc_base.batch', 'a' => 1)).to eq('create')
     end
    end

    describe '.do_destroy' do
      it 'destory' do
        expect(app.do_destroy('iqc_base.batch', 1)).to eq('destroy')
      end
    end

    describe '.do_update' do
      it 'update' do
        expect(app.do_update('iqc_base.batch', 1, a: 1)).to eq('update')
      end
    end
  end

  describe 'Ncr' do
    it 'count models' do
      expect(ooor.models).to_not be_empty
    end

    it 'db' do
      expect(ooor.db.list).to be_a(Array)
    end
  end


  describe '#create_ncr' do

     before(:each) do
      #  supplier.create(name: 'abc')
      #  part.create(no: 1)
      # # @batch = batch.create()
     end
     it 'return 0' do
       expect(ncr.find(:all).count).to eq(0)
       # expect(report.create_ncr(params = {:a => 1})).to eq('a')
     end

    it 'create a ncr' do
      # expect(batch.create(name: 'abc', part_no: 1)).to eq('1')
      expect(app.create_ncr(a: 1)).to eq('1')
      # expect(ncr.find(:all).count).to eq(100)
     # params = {
     #     ncr: {
     #         batch_id: 1
     #     }
     # }
    end

  end

end