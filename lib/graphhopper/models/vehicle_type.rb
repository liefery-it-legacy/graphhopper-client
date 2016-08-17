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

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'type_id' => :'type_id',
        
        :'profile' => :'profile',
        
        :'capacity' => :'capacity',
        
        :'speed_factor' => :'speed_factor',
        
        :'service_time_factor' => :'service_time_factor'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'type_id' => :'String',
        :'profile' => :'String',
        :'capacity' => :'Array<Integer>',
        :'speed_factor' => :'Float',
        :'service_time_factor' => :'Float'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'type_id']
        self.type_id = attributes[:'type_id']
      end
      
      if attributes[:'profile']
        self.profile = attributes[:'profile']
      end
      
      if attributes[:'capacity']
        if (value = attributes[:'capacity']).is_a?(Array)
          self.capacity = value
        end
      end
      
      if attributes[:'speed_factor']
        self.speed_factor = attributes[:'speed_factor']
      end
      
      if attributes[:'service_time_factor']
        self.service_time_factor = attributes[:'service_time_factor']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def profile=(profile)
      allowed_values = ["car", "bike", "foot", "mtb", "motorcycle", "racingbike", "truck", "small_truck", "bus"]
      if profile && !allowed_values.include?(profile)
        fail "invalid value for 'profile', must be one of #{allowed_values}"
      end
      @profile = profile
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          type_id == o.type_id &&
          profile == o.profile &&
          capacity == o.capacity &&
          speed_factor == o.speed_factor &&
          service_time_factor == o.service_time_factor
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [type_id, profile, capacity, speed_factor, service_time_factor].hash
    end

    # build the object from hash
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          else
            #TODO show warning in debug mode
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        else
          # data not found in attributes(hash), not an issue as the data can be optional
        end
      end

      self
    end

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
        if value =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        _model = GraphHopper.const_get(type).new
        _model.build_from_hash(value)
      end
    end

    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_body (backward compatibility))
    def to_body
      to_hash
    end

    # return the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Method to output non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
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
