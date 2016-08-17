require 'date'

module GraphHopper
  class Break
    # earliest start of break
    attr_accessor :earliest

    # latest start of break
    attr_accessor :latest

    # duration of break
    attr_accessor :duration

    # max driving time without break
    attr_accessor :max_driving_time

    # initial driving time, i.e. the time your driver has already spent for driving
    attr_accessor :initial_driving_time

    # array of splits
    attr_accessor :possible_split

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'earliest' => :'earliest',
        
        :'latest' => :'latest',
        
        :'duration' => :'duration',
        
        :'max_driving_time' => :'max_driving_time',
        
        :'initial_driving_time' => :'initial_driving_time',
        
        :'possible_split' => :'possible_split'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'earliest' => :'Integer',
        :'latest' => :'Integer',
        :'duration' => :'Integer',
        :'max_driving_time' => :'Integer',
        :'initial_driving_time' => :'Integer',
        :'possible_split' => :'Array<Integer>'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'earliest']
        self.earliest = attributes[:'earliest']
      end
      
      if attributes[:'latest']
        self.latest = attributes[:'latest']
      end
      
      if attributes[:'duration']
        self.duration = attributes[:'duration']
      end
      
      if attributes[:'max_driving_time']
        self.max_driving_time = attributes[:'max_driving_time']
      end
      
      if attributes[:'initial_driving_time']
        self.initial_driving_time = attributes[:'initial_driving_time']
      end
      
      if attributes[:'possible_split']
        if (value = attributes[:'possible_split']).is_a?(Array)
          self.possible_split = value
        end
      end
      
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          earliest == o.earliest &&
          latest == o.latest &&
          duration == o.duration &&
          max_driving_time == o.max_driving_time &&
          initial_driving_time == o.initial_driving_time &&
          possible_split == o.possible_split
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [earliest, latest, duration, max_driving_time, initial_driving_time, possible_split].hash
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
