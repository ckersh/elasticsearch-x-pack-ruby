module Elasticsearch
  module API
    module XPack
      module Security
        module Actions

          # TODO: Description
          #
          # @option arguments [String] :name Role name (*Required*)
          # @option arguments [Boolean] :refresh Refresh the index after performing the operation
          #
          # @see Remove a role from the native shield realm
          #
          def delete_role(arguments={})
            raise ArgumentError, "Required argument 'name' missing" unless arguments[:name]

            valid_params = [ :refresh ]

            method = HTTP_DELETE
            path   = "_xpack/security/role/#{arguments[:name]}"
            params = Utils.__validate_and_extract_params arguments, valid_params
            body   = nil

            if Array(arguments[:ignore]).include?(404)
              Utils.__rescue_from_not_found { perform_request(method, path, params, body).body }
            else
              perform_request(method, path, params, body).body
            end
          end
        end
      end
    end
  end
end