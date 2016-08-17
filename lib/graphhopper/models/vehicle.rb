require 'date'

module GraphHopper
  class Vehicle
    # Unique identifier of vehicle
    attr_accessor :vehicle_id

    # Unique identifier referring to the available vehicle types
    attr_accessor :type_id

    attr_accessor :start_address

    attr_accessor :end_address

    attr_accessor :_break

    # Indicates whether vehicle should return to start address or not. If not, it can end at any service activity.
    attr_accessor :return_to_depot

    # earliest start of vehicle at its start location
    attr_accessor :earliest_start

    # latest end of vehicle at its end location
    attr_accessor :latest_end

    # array of skills
    attr_accessor :skills

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'vehicle_id' => :'vehicle_id',
        
        :'type_id' => :'type_id',
        
        :'start_address' => :'start_address',
        
        :'end_address' => :'end_address',
        
        :'_break' => :'break',
        
        :'return_to_depot' => :'return_to_depot',
        
        :'earliest_start' => :'earliest_start',
        
        :'latest_end' => :'latest_end',
        
        :'skills' => :'skills'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'vehicle_id' => :'String',
        :'type_id' => :'String',
        :'start_address' => :'Address',
        :'end_address' => :'Address',
        :'_break' => :'Break',
        :'return_to_depot' => :'BOOLEAN',
        :'earliest_start' => :'Integer',
        :'latest_end' => :'Integer',
        :'skills' => :'Array<String>'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'vehicle_id']
        self.vehicle_id = attributes[:'vehicle_id']
      end
      
      if attributes[:'type_id']
        self.type_id = attributes[:'type_id']
      end
      
      if attributes[:'start_address']
        self.start_address = attributes[:'start_address']
      end
      
      if attributes[:'end_address']
        self.end_address = attributes[:'end_address']
      end
      
      if attributes[:'break']
        self._break = attributes[:'break']
      end
      
      if attributes[:'return_to_depot']
        self.return_to_depot = attributes[:'return_to_depot']
      end
      
      if attributes[:'earliest_start']
        self.earliest_start = attributes[:'earliest_start']
      end
      
      if attributes[:'latest_end']
        self.latest_end = attributes[:'latest_end']
      end
      
      if attributes[:'skills']
        if (value = attributes[:'skills']).is_a?(Array)
          self.skills = value
        end
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          vehicle_id == o.vehicle_id &&
          type_id == o.type_id &&
          start_address == o.start_address &&
          end_address == o.end_address &&
          _break == o._break &&
          return_to_depot == o.return_to_depot &&
          earliest_start == o.earliest_start &&
          latest_end == o.latest_end &&
          skills == o.skills
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [vehicle_id, type_id, start_address, end_address, _break, return_to_depot, earliest_start, latest_end, skills].hash
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
