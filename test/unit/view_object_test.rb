require_relative '../../lib/view_object'
require 'minitest/autorun'


describe 'ViewObject' do

  before do

  end

  describe 'the second param for instantiation' do

    it 'must instantiate without the second param' do
      ViewObject.new({})
      pass('We did not explode')
    end

    it 'must provide we get default OpenStruct to_s behavior without the second param, ' do
      view_obj = ViewObject.new({})
      assert_equal('#<ViewObject>', view_obj.to_s)
    end

    it 'must revert to default OpenStruct to_s behavior if second param names nonexistent field' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, :none_existent)
      assert_equal('#<ViewObject first_name="Bob">', view_obj.to_s)
    end

    it 'must give the to_s_field value when to_s is called' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, :first_name)
      assert_equal('Bob', view_obj.to_s)
    end

    it 'must accept the to_s_field param as a PascalCase symbol' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, :FirstName)
      assert_equal('Bob', view_obj.to_s)
    end

    it 'must accept the to_s_field param as a camelCase symbol' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, :firstName)
      assert_equal('Bob', view_obj.to_s)
    end

    it 'must accept the to_s_field param as a snake_case string' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, 'first_name')
      assert_equal('Bob', view_obj.to_s)
    end

    it 'must accept the to_s_field param as a PascalCase string' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, 'FirstName')
      assert_equal('Bob', view_obj.to_s)
    end

    it 'must accept the to_s_field param as a camelCase string' do
      view_obj = ViewObject.new({'FirstName'=>'Bob'}, 'firstName')
      assert_equal('Bob', view_obj.to_s)
    end

  end

  describe 'all fields available via snake_case' do

    describe 'accessing fields via .snake_case' do

      it 'must provide accessibility to fields via .snake_case when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj.first_name)
      end

      it 'must provide accessibility to fields via .snake_case when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj.first_name)
      end

      it 'must provide accessibility to fields via .snake_case when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj.first_name)
      end

    end

    describe 'accessing fields via ["snake_case"]' do

      it 'must provide accessibility to fields via ["snake_case"] when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj['first_name'])
      end

      it 'must provide accessibility to fields via ["snake_case"] when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj['first_name'])
      end

      it 'must provide accessibility to fields via ["snake_case"] when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj['first_name'])
      end

    end

  end

  describe 'all fields available via camelCase' do

    describe 'accessing fields via .camelCase' do

      it 'must provide accessibility to fields via .camelCase when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj.firstName)
      end

      it 'must provide accessibility to fields via .camelCase when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj.firstName)
      end

      it 'must provide accessibility to fields via .camelCase when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj.firstName)
      end

    end

    describe 'accessing fields via ["camelCase"]' do

      it 'must provide accessibility to fields via ["camelCase"] when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj[:firstName])
      end

      it 'must provide accessibility to fields via .camelCase when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj['firstName'])
      end

      it 'must provide accessibility to fields via .camelCase when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj['firstName'])
      end

    end

  end

  describe 'all fields available via PascalCase' do

    describe 'accessing fields via .PascalCase' do # even though you shouldn't do this in Ruby

      it 'must provide accessibility to fields via .PascalCase when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj.FirstName)
      end

      it 'must provide accessibility to fields via .PascalCase when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj.FirstName)
      end

      it 'must provide accessibility to fields via .PascalCase when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj.FirstName)
      end

    end

    describe 'accessing fields via ["PascalCase"]' do

      it 'must provide accessibility to fields via ["PascalCase"] when fields are supplied in snake_case' do
        view_obj = ViewObject.new({'first_name'=>'Bob'})
        assert_equal('Bob', view_obj['FirstName'])
      end

      it 'must provide accessibility to fields via .PascalCase when fields are supplied in camelCase' do
        view_obj = ViewObject.new({'firstName'=>'Bob'})
        assert_equal('Bob', view_obj['FirstName'])
      end

      it 'must provide accessibility to fields via .PascalCase when fields are supplied in PascalCase' do
        view_obj = ViewObject.new({'FirstName'=>'Bob'})
        assert_equal('Bob', view_obj['FirstName'])
      end

    end

  end

end
