module MessageHelper
  def flash_message_css_class
    if flash[:alert].present? || @alert_messages.present?
      "is-alert"
    elsif flash[:notice].present? || @notice_messages.present?
      "is-notice"
    else
      "is-hidden"
    end
  end

  def alert_messages(messages)
    @alert_messages = messages
  end

  def notice_messages(messages)
    @notice_messages = messages
  end

  def flash_messages
    [flash[:alert] || flash[:notice] || @alert_messages || @notice_messages].flatten.compact
  end
end