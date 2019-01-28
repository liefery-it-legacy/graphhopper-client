require 'date'

module GraphHopper

  class MatrixRequest
    # Specifiy multiple points for which the weight-, route-, time- or distance-matrix should be calculated. In this case the starts are identical to the destinations. If there are N points, then NxN entries will be calculated. The order of the point parameter is important. Specify at least three points. Cannot be used together with from_point or to_point. Is a string with the format longitude,latitude.
    attr_accessor :points

    # The starting points for the routes. E.g. if you want to calculate the three routes A-&gt;1, A-&gt;2, A-&gt;3 then you have one from_point parameter and three to_point parameters. Is a string with the format longitude,latitude.
    attr_accessor :from_points

    # The destination points for the routes. Is a string with the format longitude,latitude.
    attr_accessor :to_points

    # Optional parameter. Specifies a hint for each point in the `points` array to prefer a certain street for the closest location lookup. E.g. if there is an address or house with two or more neighboring streets you can control for which street the closest location is looked up.
    attr_accessor :point_hints

    # More information for the `from_points` array. See `point_hints`
    attr_accessor :from_point_hints

    # More information for the `to_points` array. See `point_hints`
    attr_accessor :to_point_hints

    # Specifies which arrays should be included in the response. Specify one or more of the following options 'weights', 'times', 'distances'. To specify more than one array use e.g. out_array=times&amp;out_array=distances. The units of the entries of distances are meters, of times are seconds and of weights is arbitrary and it can differ for different vehicles or versions of this API.
    attr_accessor :out_arrays

    # The vehicle for which the route should be calculated. Other vehicles are foot, small_truck etc, see here for the details.
    attr_accessor :vehicle


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'points' => :'points',
        :'from_points' => :'from_points',
        :'to_points' => :'to_points',
        :'point_hints' => :'point_hints',
        :'from_point_hints' => :'from_point_hints',
        :'to_point_hints' => :'to_point_hints',
        :'out_arrays' => :'out_arrays',
        :'vehicle' => :'vehicle'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'points' => :'Array<Array<Float>>',
        :'from_points' => :'Array<Array<Float>>',
        :'to_points' => :'Array<Array<Float>>',
        :'point_hints' => :'Array<String>',
        :'from_point_hints' => :'Array<String>',
        :'to_point_hints' => :'Array<String>',
        :'out_arrays' => :'Array<String>',
        :'vehicle' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'points')
        if (value = attributes[:'points']).is_a?(Array)
          self.points = value
        end
      end

      if attributes.has_key?(:'from_points')
        if (value = attributes[:'from_points']).is_a?(Array)
          self.from_points = value
        end
      end

      if attributes.has_key?(:'to_points')
        if (value = attributes[:'to_points']).is_a?(Array)
          self.to_points = value
        end
      end

      if attributes.has_key?(:'point_hints')
        if (value = attributes[:'point_hints']).is_a?(Array)
          self.point_hints = value
        end
      end

      if attributes.has_key?(:'from_point_hints')
        if (value = attributes[:'from_point_hints']).is_a?(Array)
          self.from_point_hints = value
        end
      end

      if attributes.has_key?(:'to_point_hints')
        if (value = attributes[:'to_point_hints']).is_a?(Array)
          self.to_point_hints = value
        end
      end

      if attributes.has_key?(:'out_arrays')
        if (value = attributes[:'out_arrays']).is_a?(Array)
          self.out_arrays = value
        end
      end

      if attributes.has_key?(:'vehicle')
        self.vehicle = attributes[:'vehicle']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          points == o.points &&
          from_points == o.from_points &&
          to_points == o.to_points &&
          point_hints == o.point_hints &&
          from_point_hints == o.from_point_hints &&
          to_point_hints == o.to_point_hints &&
          out_arrays == o.out_arrays &&
          vehicle == o.vehicle
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [points, from_points, to_points, point_hints, from_point_hints, to_point_hints, out_arrays, vehicle].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = GraphHopper.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
