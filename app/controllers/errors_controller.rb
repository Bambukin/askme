class ErrorsController < ApplicationController
  def not_authorized
    @title = '403'
    render status: 403, layout: 'errors'
  end

  def not_found
    @title = '404'
    render status: 404, layout: 'errors'
  end

  def unprocessable_entity
    @title = '422'
    render status: 422, layout: 'errors'
  end

  def internal_server_error
    @title = '500'
    render status: 500, layout: 'errors'
  end
end
