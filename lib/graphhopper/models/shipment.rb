require 'date'

module GraphHopper
  class Shipment
    # Unique identifier of service
    attr_accessor :id

    # name of shipment
    attr_accessor :name

    # priority of service, i.e. 1 = high, 2 = normal, 3 = low. default is 2.
    attr_accessor :priority

    attr_accessor :pickup

    attr_accessor :delivery

    # array of capacity dimensions
    attr_accessor :size

    # array of required skills
    attr_accessor :required_skills

    # array of allowed vehicle ids
    attr_accessor :allowed_vehicles

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'id' => :'id',
        
        :'name' => :'name',
        
        :'priority' => :'priority',
        
        :'pickup' => :'pickup',
        
        :'delivery' => :'delivery',
        
        :'size' => :'size',
        
        :'required_skills' => :'required_skills',
        
        :'allowed_vehicles' => :'allowed_vehicles'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'name' => :'String',
        :'priority' => :'Integer',
        :'pickup' => :'Stop',
        :'delivery' => :'Stop',
        :'size' => :'Array<Integer>',
        :'required_skills' => :'Array<String>',
        :'allowed_vehicles' => :'Array<String>'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'name']
        self.name = attributes[:'name']
      end
      
      if attributes[:'priority']
        self.priority = attributes[:'priority']
      end
      
      if attributes[:'pickup']
        self.pickup = attributes[:'pickup']
      end
      
      if attributes[:'delivery']
        self.delivery = attributes[:'delivery']
      end
      
      if attributes[:'size']
        if (value = attributes[:'size']).is_a?(Array)
          self.size = value
        end
      end
      
      if attributes[:'required_skills']
        if (value = attributes[:'required_skills']).is_a?(Array)
          self.required_skills = value
        end
      end
      
      if attributes[:'allowed_vehicles']
        if (value = attributes[:'allowed_vehicles']).is_a?(Array)
          self.allowed_vehicles = value
        end
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          name == o.name &&
          priority == o.priority &&
          pickup == o.pickup &&
          delivery == o.delivery &&
          size == o.size &&
          required_skills == o.required_skills &&
          allowed_vehicles == o.allowed_vehicles
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [id, name, priority, pickup, delivery, size, required_skills, allowed_vehicles].hash
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
