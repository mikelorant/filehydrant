module ApplicationHelper
  def status(value)
    value ? 'success' : 'failure'
  end
end
