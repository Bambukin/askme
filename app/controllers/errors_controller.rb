class ErrorsController < ApplicationController
  def not_authorized
    render status: 403, layout: 'errors'
  end

  def not_found
    render status: 404, layout: 'errors'
  end

  def unprocessable_entity
    render status: 422, layout: 'errors'
  end

  def internal_server_error
    render status: 500, layout: 'errors'
  end
end
