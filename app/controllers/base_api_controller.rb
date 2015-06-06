require 'responders/json_responder'

class BaseApiController < InheritedResources::Base
  acts_as_token_authentication_handler_for User

  respond_to :json
  responders :json

  def collection
    limit_per_page = params[:per_page] || nil
    @q = end_of_association_chain
    @q = @q.search(params[:q])
    @q = @q.result

    @total_count = @q.length
    limit_per_page ||= @total_count

    # Pagination
    if params[:from]
      @q = @q.with_name_from(params[:from][:name], limit_per_page) if params[:from][:name]
      @q = @q.with_field_from(params[:from][:field], params[:from][:value]) if params[:from][:field]
    end

    @q.limit(limit_per_page)
  end

  def default_serializer_options
    { meta: { pagination: { total_objects: @total_count } } }
  end
end
