require 'date'

module GraphHopper
  class Solution
    # overall costs of solution
    attr_accessor :costs

    # overall travel distance in meters
    attr_accessor :distance

    # overall travel time in ms
    attr_accessor :time

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
        :'no_unassigned' => :'Integer',
        :'routes' => :'Array<Route>',
        :'unassigned' => :'Solution_unassigned'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'costs']
        self.costs = attributes[:'costs']
      end
      
      if attributes[:'distance']
        self.distance = attributes[:'distance']
      end
      
      if attributes[:'time']
        self.time = attributes[:'time']
      end
      
      if attributes[:'no_unassigned']
        self.no_unassigned = attributes[:'no_unassigned']
      end
      
      if attributes[:'routes']
        if (value = attributes[:'routes']).is_a?(Array)
          self.routes = value
        end
      end
      
      if attributes[:'unassigned']
        self.unassigned = attributes[:'unassigned']
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          costs == o.costs &&
          distance == o.distance &&
          time == o.time &&
          no_unassigned == o.no_unassigned &&
          routes == o.routes &&
          unassigned == o.unassigned
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [costs, distance, time, no_unassigned, routes, unassigned].hash
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
