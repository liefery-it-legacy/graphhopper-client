require "uri"

module GraphHopper
  class VrpApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Solves vehicle routing problems
    # This endpoint for solving vehicle routing problems, i.e. traveling salesman or vehicle routing problems, and returns the solution.
    # @param key your API key
    # @param body Request object that contains the problem to be solved
    # @param [Hash] opts the optional parameters
    # @return [JobId]
    def post_vrp(key, body, opts = {})
      data, status_code, headers = post_vrp_with_http_info(key, body, opts)
      return data
    end

    # Solves vehicle routing problems
    # This endpoint for solving vehicle routing problems, i.e. traveling salesman or vehicle routing problems, and returns the solution.
    # @param key your API key
    # @param body Request object that contains the problem to be solved
    # @param [Hash] opts the optional parameters
    # @return [Array<(JobId, Fixnum, Hash)>] JobId data, response status code and response headers
    def post_vrp_with_http_info(key, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: VrpApi#post_vrp ..."
      end
      
      # verify the required parameter 'key' is set
      fail "Missing the required parameter 'key' when calling post_vrp" if key.nil?
      
      # verify the required parameter 'body' is set
      fail "Missing the required parameter 'body' when calling post_vrp" if body.nil?
      
      # resource path
      path = "/optimize".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'key'] = key

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      _header_accept = ['application/json']
      _header_accept_result = @api_client.select_header_accept(_header_accept) and header_params['Accept'] = _header_accept_result

      # HTTP header 'Content-Type'
      _header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      

      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'JobId')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: VrpApi#post_vrp\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end




