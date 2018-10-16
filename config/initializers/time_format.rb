# カスタムフォーマットを定義
Time::DATE_FORMATS[:jp_date_format] = "%Y年%m月%d日 %H:%M"
Time::DATE_FORMATS[:api] = lambda { |t| t.iso8601 }
Date::DATE_FORMATS[:api] = lambda { |t| t.iso8601 }
