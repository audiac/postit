module ApplicationHelper
  def fix_url(orig_url)
    orig_url.starts_with?('http://') ? orig_url : "http://#{orig_url}"
  end

  def friendly_datetime(orig_dt)
    if logged_in? && !current_user.time_zone.blank?
      orig_dt = orig_dt.in_time_zone(current_user.time_zone)
    end
    orig_dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
