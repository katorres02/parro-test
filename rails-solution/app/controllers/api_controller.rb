# inherited from applicationController so we can add new rules for this controller
# like custom authentication protocols
class ApiController < ApplicationController
  protect_from_forgery with: :null_session
end
