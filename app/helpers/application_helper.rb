module ApplicationHelper
  def fix_url(orig_url)
    orig_url.starts_with?('http://') ? orig_url : "http://#{orig_url}"
  end

  def friendly_datetime(orig_dt)
    orig_dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
