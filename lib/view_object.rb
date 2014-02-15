#
# Extend OpenStruct to accept CamelCase or snake_case field names
#
#     # these both work
#     viewObj.shortSign
#     viewObj.short_sign
#
# The initializer also accepts a to_string_field param who's value
# will be used for the to_s method
class ViewObject < OpenStruct

  # @param [Hash] state
  # @param [Symbol] to_string_field This is the field from state who's value
  #        will be used for the to_s method
  def initialize(state, to_string_field)
    @to_string_field = to_string_field.to_sym
    super(underscore_ize_keys(state))
  end

  # @return [String]
  def to_s
    send(@to_string_field)
  end

  # For a ViewObject with state: {'foo': 'hello'},
  # this method_missing implementation provides this usage:
  #
  #     puts viewObj['foo']
  #     puts viewObj.foo
  #
  # Field names are also normalized in the sense that you can
  # ask for camelCase or snake_case
  #
  #     # these both work
  #     viewObj.shortSign
  #     viewObj.short_sign
  #
  # @param [String] meth
  def method_missing(meth)
    key = underscore(meth.to_s == '[]' ? args[0] : meth.to_s).to_sym
    if self.respond_to?(key)
      send(key)
    else
      super
    end
  end

  private

  # Recursively convert all keys to snake_case
  # @param [Hash] hash
  # @return [Hash]
  def underscore_ize_keys(hash)
    hash.inject({}){|result, (key, value)|
      new_key = case key
                  when String then underscore(key)
                  else key
                end
      new_value = case value
                    when Hash then underscore_ize_keys(value)
                    else value
                  end
      result[new_key] = new_value
      result
    }
  end

  # Convert CamelCase to snake_case
  # @param [String] camel_case
  # @return [String]
  def underscore(camel_case)
    camel_case.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
  end
end