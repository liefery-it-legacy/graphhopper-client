require "uri"

module GraphHopper
  class GeocodingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Execute a Geocoding request
    # This endpoint provides forward and reverse geocoding. For more details, review the official documentation at: https://graphhopper.com/api/1/docs/geocoding/
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q If you do forward geocoding, then this would be a textual description of the address you are looking for
    # @option opts [String] :locale Display the search results for the specified locale. Currently French (fr), English (en), German (de) and Italian (it) are supported. If the locale wasn&#39;t found the default (en) is used.
    # @option opts [Integer] :limit Specify the maximum number of returned results
    # @option opts [BOOLEAN] :reverse Set to true to do a reverse Geocoding request, see point parameter
    # @option opts [String] :point The location bias in the format &#39;latitude,longitude&#39; e.g. point&#x3D;45.93272,11.58803
    # @option opts [String] :provider Can be either, default, nominatim, opencagedata
    # @return [GeocodingResponse]
    def geocode_get(key, opts = {})
      data, _status_code, _headers = geocode_get_with_http_info(key, opts)
      return data
    end

    # Execute a Geocoding request
    # This endpoint provides forward and reverse geocoding. For more details, review the official documentation at: https://graphhopper.com/api/1/docs/geocoding/
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [String] :q If you do forward geocoding, then this would be a textual description of the address you are looking for
    # @option opts [String] :locale Display the search results for the specified locale. Currently French (fr), English (en), German (de) and Italian (it) are supported. If the locale wasn&#39;t found the default (en) is used.
    # @option opts [Integer] :limit Specify the maximum number of returned results
    # @option opts [BOOLEAN] :reverse Set to true to do a reverse Geocoding request, see point parameter
    # @option opts [String] :point The location bias in the format &#39;latitude,longitude&#39; e.g. point&#x3D;45.93272,11.58803
    # @option opts [String] :provider Can be either, default, nominatim, opencagedata
    # @return [Array<(GeocodingResponse, Fixnum, Hash)>] GeocodingResponse data, response status code and response headers
    def geocode_get_with_http_info(key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GeocodingApi.geocode_get ..."
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling GeocodingApi.geocode_get"
      end
      # resource path
      local_var_path = "/geocode"

      # query parameters
      query_params = {}
      query_params[:'key'] = key
      query_params[:'q'] = opts[:'q'] if !opts[:'q'].nil?
      query_params[:'locale'] = opts[:'locale'] if !opts[:'locale'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'reverse'] = opts[:'reverse'] if !opts[:'reverse'].nil?
      query_params[:'point'] = opts[:'point'] if !opts[:'point'].nil?
      query_params[:'provider'] = opts[:'provider'] if !opts[:'provider'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GeocodingResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GeocodingApi#geocode_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
