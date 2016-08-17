require 'date'

module GraphHopper
  class Request
    # An array of vehicles that can be employed
    attr_accessor :vehicles

    # An array of vehicle types
    attr_accessor :vehicle_types

    # An array of services
    attr_accessor :services

    # An array of shipments
    attr_accessor :shipments

    # An array of relations
    attr_accessor :relations

    attr_accessor :algorithm

    # An array of objectives
    attr_accessor :objectives

    # An array of cost matrices
    attr_accessor :cost_matrices

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'vehicles' => :'vehicles',
        
        :'vehicle_types' => :'vehicle_types',
        
        :'services' => :'services',
        
        :'shipments' => :'shipments',
        
        :'relations' => :'relations',
        
        :'algorithm' => :'algorithm',
        
        :'objectives' => :'objectives',
        
        :'cost_matrices' => :'cost_matrices'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'vehicles' => :'Array<Vehicle>',
        :'vehicle_types' => :'Array<VehicleType>',
        :'services' => :'Array<Service>',
        :'shipments' => :'Array<Shipment>',
        :'relations' => :'Array<Relation>',
        :'algorithm' => :'Algorithm',
        :'objectives' => :'Array<Objective>',
        :'cost_matrices' => :'Array<CostMatrix>'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'vehicles']
        if (value = attributes[:'vehicles']).is_a?(Array)
          self.vehicles = value
        end
      end
      
      if attributes[:'vehicle_types']
        if (value = attributes[:'vehicle_types']).is_a?(Array)
          self.vehicle_types = value
        end
      end
      
      if attributes[:'services']
        if (value = attributes[:'services']).is_a?(Array)
          self.services = value
        end
      end
      
      if attributes[:'shipments']
        if (value = attributes[:'shipments']).is_a?(Array)
          self.shipments = value
        end
      end
      
      if attributes[:'relations']
        if (value = attributes[:'relations']).is_a?(Array)
          self.relations = value
        end
      end
      
      if attributes[:'algorithm']
        self.algorithm = attributes[:'algorithm']
      end
      
      if attributes[:'objectives']
        if (value = attributes[:'objectives']).is_a?(Array)
          self.objectives = value
        end
      end
      
      if attributes[:'cost_matrices']
        if (value = attributes[:'cost_matrices']).is_a?(Array)
          self.cost_matrices = value
        end
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          vehicles == o.vehicles &&
          vehicle_types == o.vehicle_types &&
          services == o.services &&
          shipments == o.shipments &&
          relations == o.relations &&
          algorithm == o.algorithm &&
          objectives == o.objectives &&
          cost_matrices == o.cost_matrices
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [vehicles, vehicle_types, services, shipments, relations, algorithm, objectives, cost_matrices].hash
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
