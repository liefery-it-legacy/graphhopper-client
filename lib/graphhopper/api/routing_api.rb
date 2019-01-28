require "uri"

module GraphHopper
  class RoutingApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Routing Request
    # The GraphHopper Routing API allows to calculate route and implement navigation via the turn instructions
    # @param point Specify multiple points for which the route should be calculated. The order is important. Specify at least two points.
    # @param points_encoded IMPORTANT- TODO - currently you have to pass false for the swagger client - Have not found a way to force add a parameter. If &#x60;false&#x60; the coordinates in &#x60;point&#x60; and &#x60;snapped_waypoints&#x60; are returned as array using the order [lon,lat,elevation] for every point. If &#x60;true&#x60; the coordinates will be encoded as string leading to less bandwith usage. You&#39;ll need a special handling for the decoding of this string on the client-side. We provide open source code in [Java](https://github.com/graphhopper/graphhopper/blob/d70b63660ac5200b03c38ba3406b8f93976628a6/web/src/main/java/com/graphhopper/http/WebHelper.java#L43) and [JavaScript](https://github.com/graphhopper/graphhopper/blob/d70b63660ac5200b03c38ba3406b8f93976628a6/web/src/main/webapp/js/ghrequest.js#L139). It is especially important to use no 3rd party client if you set &#x60;elevation&#x3D;true&#x60;!
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [String] :locale The locale of the resulting turn instructions. E.g. &#x60;pt_PT&#x60; for Portuguese or &#x60;de&#x60; for German
    # @option opts [BOOLEAN] :instructions If instruction should be calculated and returned
    # @option opts [String] :vehicle The vehicle for which the route should be calculated. Other vehicles are foot, small_truck, ...
    # @option opts [BOOLEAN] :elevation If &#x60;true&#x60; a third dimension - the elevation - is included in the polyline or in the GeoJson. If enabled you have to use a modified version of the decoding method or set points_encoded to &#x60;false&#x60;. See the points_encoded attribute for more details. Additionally a request can fail if the vehicle does not support elevation. See the features object for every vehicle.
    # @option opts [BOOLEAN] :calc_points If the points for the route should be calculated at all printing out only distance and time.
    # @option opts [Array<String>] :point_hint Optional parameter. Specifies a hint for each &#x60;point&#x60; parameter to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    # @option opts [BOOLEAN] :ch_disable Use this parameter in combination with one or more parameters of this table
    # @option opts [String] :weighting Which kind of &#39;best&#39; route calculation you need. Other option is &#x60;shortest&#x60; (e.g. for &#x60;vehicle&#x3D;foot&#x60; or &#x60;bike&#x60;), &#x60;short_fastest&#x60; if time and distance is expensive e.g. for &#x60;vehicle&#x3D;truck&#x60;
    # @option opts [BOOLEAN] :edge_traversal Use &#x60;true&#x60; if you want to consider turn restrictions for bike and motor vehicles. Keep in mind that the response time is roughly 2 times slower.
    # @option opts [String] :algorithm The algorithm to calculate the route. Other options are &#x60;dijkstra&#x60;, &#x60;astar&#x60;, &#x60;astarbi&#x60;, &#x60;alternative_route&#x60; and &#x60;round_trip&#x60;
    # @option opts [Integer] :heading Favour a heading direction for a certain point. Specify either one heading for the start point or as many as there are points. In this case headings are associated by their order to the specific points. Headings are given as north based clockwise angle between 0 and 360 degree. This parameter also influences the tour generated with &#x60;algorithm&#x3D;round_trip&#x60; and force the initial direction.
    # @option opts [Integer] :heading_penalty Penalty for omitting a specified heading. The penalty corresponds to the accepted time delay in seconds in comparison to the route without a heading.
    # @option opts [BOOLEAN] :pass_through If &#x60;true&#x60; u-turns are avoided at via-points with regard to the &#x60;heading_penalty&#x60;.
    # @option opts [Array<String>] :details List of additional trip attributes to be returned. Try some of the following: &#x60;average_speed&#x60;, &#x60;street_name&#x60;, &#x60;edge_id&#x60;, &#x60;time&#x60;, &#x60;distance&#x60;.
    # @option opts [Integer] :round_trip_distance If &#x60;algorithm&#x3D;round_trip&#x60; this parameter configures approximative length of the resulting round trip
    # @option opts [Integer] :round_trip_seed If &#x60;algorithm&#x3D;round_trip&#x60; this parameter introduces randomness if e.g. the first try wasn&#39;t good.
    # @option opts [Integer] :alternative_route_max_paths If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter sets the number of maximum paths which should be calculated. Increasing can lead to worse alternatives.
    # @option opts [Integer] :alternative_route_max_weight_factor If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter sets the factor by which the alternatives routes can be longer than the optimal route. Increasing can lead to worse alternatives.
    # @option opts [Integer] :alternative_route_max_share_factor If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter specifies how much alternatives routes can have maximum in common with the optimal route. Increasing can lead to worse alternatives.
    # @option opts [String] :avoid comma separate list to avoid certain roads. You can avoid motorway, ferry, tunnel or track
    # @return [RouteResponse]
    def route_get(point, points_encoded, key, opts = {})
      data, _status_code, _headers = route_get_with_http_info(point, points_encoded, key, opts)
      return data
    end

    # Routing Request
    # The GraphHopper Routing API allows to calculate route and implement navigation via the turn instructions
    # @param point Specify multiple points for which the route should be calculated. The order is important. Specify at least two points.
    # @param points_encoded IMPORTANT- TODO - currently you have to pass false for the swagger client - Have not found a way to force add a parameter. If &#x60;false&#x60; the coordinates in &#x60;point&#x60; and &#x60;snapped_waypoints&#x60; are returned as array using the order [lon,lat,elevation] for every point. If &#x60;true&#x60; the coordinates will be encoded as string leading to less bandwith usage. You&#39;ll need a special handling for the decoding of this string on the client-side. We provide open source code in [Java](https://github.com/graphhopper/graphhopper/blob/d70b63660ac5200b03c38ba3406b8f93976628a6/web/src/main/java/com/graphhopper/http/WebHelper.java#L43) and [JavaScript](https://github.com/graphhopper/graphhopper/blob/d70b63660ac5200b03c38ba3406b8f93976628a6/web/src/main/webapp/js/ghrequest.js#L139). It is especially important to use no 3rd party client if you set &#x60;elevation&#x3D;true&#x60;!
    # @param key Get your key at graphhopper.com
    # @param [Hash] opts the optional parameters
    # @option opts [String] :locale The locale of the resulting turn instructions. E.g. &#x60;pt_PT&#x60; for Portuguese or &#x60;de&#x60; for German
    # @option opts [BOOLEAN] :instructions If instruction should be calculated and returned
    # @option opts [String] :vehicle The vehicle for which the route should be calculated. Other vehicles are foot, small_truck, ...
    # @option opts [BOOLEAN] :elevation If &#x60;true&#x60; a third dimension - the elevation - is included in the polyline or in the GeoJson. If enabled you have to use a modified version of the decoding method or set points_encoded to &#x60;false&#x60;. See the points_encoded attribute for more details. Additionally a request can fail if the vehicle does not support elevation. See the features object for every vehicle.
    # @option opts [BOOLEAN] :calc_points If the points for the route should be calculated at all printing out only distance and time.
    # @option opts [Array<String>] :point_hint Optional parameter. Specifies a hint for each &#x60;point&#x60; parameter to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    # @option opts [BOOLEAN] :ch_disable Use this parameter in combination with one or more parameters of this table
    # @option opts [String] :weighting Which kind of &#39;best&#39; route calculation you need. Other option is &#x60;shortest&#x60; (e.g. for &#x60;vehicle&#x3D;foot&#x60; or &#x60;bike&#x60;), &#x60;short_fastest&#x60; if time and distance is expensive e.g. for &#x60;vehicle&#x3D;truck&#x60;
    # @option opts [BOOLEAN] :edge_traversal Use &#x60;true&#x60; if you want to consider turn restrictions for bike and motor vehicles. Keep in mind that the response time is roughly 2 times slower.
    # @option opts [String] :algorithm The algorithm to calculate the route. Other options are &#x60;dijkstra&#x60;, &#x60;astar&#x60;, &#x60;astarbi&#x60;, &#x60;alternative_route&#x60; and &#x60;round_trip&#x60;
    # @option opts [Integer] :heading Favour a heading direction for a certain point. Specify either one heading for the start point or as many as there are points. In this case headings are associated by their order to the specific points. Headings are given as north based clockwise angle between 0 and 360 degree. This parameter also influences the tour generated with &#x60;algorithm&#x3D;round_trip&#x60; and force the initial direction.
    # @option opts [Integer] :heading_penalty Penalty for omitting a specified heading. The penalty corresponds to the accepted time delay in seconds in comparison to the route without a heading.
    # @option opts [BOOLEAN] :pass_through If &#x60;true&#x60; u-turns are avoided at via-points with regard to the &#x60;heading_penalty&#x60;.
    # @option opts [Array<String>] :details List of additional trip attributes to be returned. Try some of the following: &#x60;average_speed&#x60;, &#x60;street_name&#x60;, &#x60;edge_id&#x60;, &#x60;time&#x60;, &#x60;distance&#x60;.
    # @option opts [Integer] :round_trip_distance If &#x60;algorithm&#x3D;round_trip&#x60; this parameter configures approximative length of the resulting round trip
    # @option opts [Integer] :round_trip_seed If &#x60;algorithm&#x3D;round_trip&#x60; this parameter introduces randomness if e.g. the first try wasn&#39;t good.
    # @option opts [Integer] :alternative_route_max_paths If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter sets the number of maximum paths which should be calculated. Increasing can lead to worse alternatives.
    # @option opts [Integer] :alternative_route_max_weight_factor If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter sets the factor by which the alternatives routes can be longer than the optimal route. Increasing can lead to worse alternatives.
    # @option opts [Integer] :alternative_route_max_share_factor If &#x60;algorithm&#x3D;alternative_route&#x60; this parameter specifies how much alternatives routes can have maximum in common with the optimal route. Increasing can lead to worse alternatives.
    # @option opts [String] :avoid comma separate list to avoid certain roads. You can avoid motorway, ferry, tunnel or track
    # @return [Array<(RouteResponse, Fixnum, Hash)>] RouteResponse data, response status code and response headers
    def route_get_with_http_info(point, points_encoded, key, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RoutingApi.route_get ..."
      end
      # verify the required parameter 'point' is set
      if @api_client.config.client_side_validation && point.nil?
        fail ArgumentError, "Missing the required parameter 'point' when calling RoutingApi.route_get"
      end
      # verify the required parameter 'points_encoded' is set
      if @api_client.config.client_side_validation && points_encoded.nil?
        fail ArgumentError, "Missing the required parameter 'points_encoded' when calling RoutingApi.route_get"
      end
      # verify the required parameter 'key' is set
      if @api_client.config.client_side_validation && key.nil?
        fail ArgumentError, "Missing the required parameter 'key' when calling RoutingApi.route_get"
      end
      # resource path
      local_var_path = "/route"

      # query parameters
      query_params = {}
      query_params[:'point'] = @api_client.build_collection_param(point, :multi)
      query_params[:'points_encoded'] = points_encoded
      query_params[:'key'] = key
      query_params[:'locale'] = opts[:'locale'] if !opts[:'locale'].nil?
      query_params[:'instructions'] = opts[:'instructions'] if !opts[:'instructions'].nil?
      query_params[:'vehicle'] = opts[:'vehicle'] if !opts[:'vehicle'].nil?
      query_params[:'elevation'] = opts[:'elevation'] if !opts[:'elevation'].nil?
      query_params[:'calc_points'] = opts[:'calc_points'] if !opts[:'calc_points'].nil?
      query_params[:'point_hint'] = @api_client.build_collection_param(opts[:'point_hint'], :multi) if !opts[:'point_hint'].nil?
      query_params[:'ch.disable'] = opts[:'ch_disable'] if !opts[:'ch_disable'].nil?
      query_params[:'weighting'] = opts[:'weighting'] if !opts[:'weighting'].nil?
      query_params[:'edge_traversal'] = opts[:'edge_traversal'] if !opts[:'edge_traversal'].nil?
      query_params[:'algorithm'] = opts[:'algorithm'] if !opts[:'algorithm'].nil?
      query_params[:'heading'] = opts[:'heading'] if !opts[:'heading'].nil?
      query_params[:'heading_penalty'] = opts[:'heading_penalty'] if !opts[:'heading_penalty'].nil?
      query_params[:'pass_through'] = opts[:'pass_through'] if !opts[:'pass_through'].nil?
      query_params[:'details'] = @api_client.build_collection_param(opts[:'details'], :multi) if !opts[:'details'].nil?
      query_params[:'round_trip.distance'] = opts[:'round_trip_distance'] if !opts[:'round_trip_distance'].nil?
      query_params[:'round_trip.seed'] = opts[:'round_trip_seed'] if !opts[:'round_trip_seed'].nil?
      query_params[:'alternative_route.max_paths'] = opts[:'alternative_route_max_paths'] if !opts[:'alternative_route_max_paths'].nil?
      query_params[:'alternative_route.max_weight_factor'] = opts[:'alternative_route_max_weight_factor'] if !opts[:'alternative_route_max_weight_factor'].nil?
      query_params[:'alternative_route.max_share_factor'] = opts[:'alternative_route_max_share_factor'] if !opts[:'alternative_route_max_share_factor'].nil?
      query_params[:'avoid'] = opts[:'avoid'] if !opts[:'avoid'].nil?

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
        :return_type => 'RouteResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RoutingApi#route_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
