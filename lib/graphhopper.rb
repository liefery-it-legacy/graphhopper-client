# Common files
require 'graphhopper/api_client'
require 'graphhopper/api_error'
require 'graphhopper/version'
require 'graphhopper/configuration'

# Models
require 'graphhopper/models/job_id'
require 'graphhopper/models/request'
require 'graphhopper/models/vehicle'
require 'graphhopper/models/algorithm'
require 'graphhopper/models/address'
require 'graphhopper/models/break'
require 'graphhopper/models/vehicle_type'
require 'graphhopper/models/service'
require 'graphhopper/models/shipment'
require 'graphhopper/models/stop'
require 'graphhopper/models/time_window'
require 'graphhopper/models/objective'
require 'graphhopper/models/cost_matrix'
require 'graphhopper/models/relation'
require 'graphhopper/models/response'
require 'graphhopper/models/solution'
require 'graphhopper/models/route'
require 'graphhopper/models/activity'
require 'graphhopper/models/solution_unassigned'

# APIs
require 'graphhopper/api/vrp_api'
require 'graphhopper/api/solution_api'

module GraphHopper
  class << self
    # Customize default settings for the SDK using block.
    #   GraphHopper.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
