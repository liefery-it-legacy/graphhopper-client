require 'date'

module GraphHopper

  class Solution
    # overall costs of solution
    attr_accessor :costs

    # overall travel distance in meters
    attr_accessor :distance

    # overall transport time in seconds
    attr_accessor :time

    # overall transport time in seconds
    attr_accessor :transport_time

    # operation time of the longest route in seconds
    attr_accessor :max_operation_time

    # total waiting time in seconds
    attr_accessor :waiting_time

    # total service time in seconds
    attr_accessor :service_duration

    # total preparation time in seconds
    attr_accessor :preparation_time

    # total completion time in seconds
    attr_accessor :completion_time

    # number of employed vehicles
    attr_accessor :no_vehicles

    # number of jobs that could not be assigned to final solution
    attr_accessor :no_unassigned

    # An array of routes
    attr_accessor :routes

    attr_accessor :unassigned


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'costs' => :'costs',
        :'distance' => :'distance',
        :'time' => :'time',
        :'transport_time' => :'transport_time',
        :'max_operation_time' => :'max_operation_time',
        :'waiting_time' => :'waiting_time',
        :'service_duration' => :'service_duration',
        :'preparation_time' => :'preparation_time',
        :'completion_time' => :'completion_time',
        :'no_vehicles' => :'no_vehicles',
        :'no_unassigned' => :'no_unassigned',
        :'routes' => :'routes',
        :'unassigned' => :'unassigned'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'costs' => :'Integer',
        :'distance' => :'Integer',
        :'time' => :'Integer',
        :'transport_time' => :'Integer',
        :'max_operation_time' => :'Integer',
        :'waiting_time' => :'Integer',
        :'service_duration' => :'Integer',
        :'preparation_time' => :'Integer',
        :'completion_time' => :'Integer',
        :'no_vehicles' => :'Integer',
        :'no_unassigned' => :'Integer',
        :'routes' => :'Array<Route>',
        :'unassigned' => :'SolutionUnassigned'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'costs')
        self.costs = attributes[:'costs']
      end

      if attributes.has_key?(:'distance')
        self.distance = attributes[:'distance']
      end

      if attributes.has_key?(:'time')
        self.time = attributes[:'time']
      end

      if attributes.has_key?(:'transport_time')
        self.transport_time = attributes[:'transport_time']
      end

      if attributes.has_key?(:'max_operation_time')
        self.max_operation_time = attributes[:'max_operation_time']
      end

      if attributes.has_key?(:'waiting_time')
        self.waiting_time = attributes[:'waiting_time']
      end

      if attributes.has_key?(:'service_duration')
        self.service_duration = attributes[:'service_duration']
      end

      if attributes.has_key?(:'preparation_time')
        self.preparation_time = attributes[:'preparation_time']
      end

      if attributes.has_key?(:'completion_time')
        self.completion_time = attributes[:'completion_time']
      end

      if attributes.has_key?(:'no_vehicles')
        self.no_vehicles = attributes[:'no_vehicles']
      end

      if attributes.has_key?(:'no_unassigned')
        self.no_unassigned = attributes[:'no_unassigned']
      end

      if attributes.has_key?(:'routes')
        if (value = attributes[:'routes']).is_a?(Array)
          self.routes = value
        end
      end

      if attributes.has_key?(:'unassigned')
        self.unassigned = attributes[:'unassigned']
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
          costs == o.costs &&
          distance == o.distance &&
          time == o.time &&
          transport_time == o.transport_time &&
          max_operation_time == o.max_operation_time &&
          waiting_time == o.waiting_time &&
          service_duration == o.service_duration &&
          preparation_time == o.preparation_time &&
          completion_time == o.completion_time &&
          no_vehicles == o.no_vehicles &&
          no_unassigned == o.no_unassigned &&
          routes == o.routes &&
          unassigned == o.unassigned
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [costs, distance, time, transport_time, max_operation_time, waiting_time, service_duration, preparation_time, completion_time, no_vehicles, no_unassigned, routes, unassigned].hash
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
