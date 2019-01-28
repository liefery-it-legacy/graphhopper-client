require 'date'

module GraphHopper

  class VehicleType
    # Unique identifier for the vehicle type
    attr_accessor :type_id

    # Profile of vehicle type
    attr_accessor :profile

    # array of capacity dimensions
    attr_accessor :capacity

    # speed_factor of vehicle type
    attr_accessor :speed_factor

    # service time factor of vehicle type
    attr_accessor :service_time_factor

    # cost parameter per distance unit, here meter is used
    attr_accessor :cost_per_meter

    # cost parameter per time unit, here second is used
    attr_accessor :cost_per_second

    # cost parameter vehicle activation, i.e. fixed costs per vehicle
    attr_accessor :cost_per_activation

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'type_id' => :'type_id',
        :'profile' => :'profile',
        :'capacity' => :'capacity',
        :'speed_factor' => :'speed_factor',
        :'service_time_factor' => :'service_time_factor',
        :'cost_per_meter' => :'cost_per_meter',
        :'cost_per_second' => :'cost_per_second',
        :'cost_per_activation' => :'cost_per_activation'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'type_id' => :'String',
        :'profile' => :'String',
        :'capacity' => :'Array<Integer>',
        :'speed_factor' => :'Float',
        :'service_time_factor' => :'Float',
        :'cost_per_meter' => :'Float',
        :'cost_per_second' => :'Float',
        :'cost_per_activation' => :'Float'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'type_id')
        self.type_id = attributes[:'type_id']
      end

      if attributes.has_key?(:'profile')
        self.profile = attributes[:'profile']
      end

      if attributes.has_key?(:'capacity')
        if (value = attributes[:'capacity']).is_a?(Array)
          self.capacity = value
        end
      end

      if attributes.has_key?(:'speed_factor')
        self.speed_factor = attributes[:'speed_factor']
      end

      if attributes.has_key?(:'service_time_factor')
        self.service_time_factor = attributes[:'service_time_factor']
      end

      if attributes.has_key?(:'cost_per_meter')
        self.cost_per_meter = attributes[:'cost_per_meter']
      end

      if attributes.has_key?(:'cost_per_second')
        self.cost_per_second = attributes[:'cost_per_second']
      end

      if attributes.has_key?(:'cost_per_activation')
        self.cost_per_activation = attributes[:'cost_per_activation']
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
      profile_validator = EnumAttributeValidator.new('String', ["car", "bike", "foot", "hike", "mtb", "racingbike", "scooter", "truck", "small_truck"])
      return false unless profile_validator.valid?(@profile)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] profile Object to be assigned
    def profile=(profile)
      validator = EnumAttributeValidator.new('String', ["car", "bike", "foot", "hike", "mtb", "racingbike", "scooter", "truck", "small_truck"])
      unless validator.valid?(profile)
        fail ArgumentError, "invalid value for 'profile', must be one of #{validator.allowable_values}."
      end
      @profile = profile
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          type_id == o.type_id &&
          profile == o.profile &&
          capacity == o.capacity &&
          speed_factor == o.speed_factor &&
          service_time_factor == o.service_time_factor &&
          cost_per_meter == o.cost_per_meter &&
          cost_per_second == o.cost_per_second &&
          cost_per_activation == o.cost_per_activation
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [type_id, profile, capacity, speed_factor, service_time_factor, cost_per_meter, cost_per_second, cost_per_activation].hash
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
