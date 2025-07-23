class TranslationsController < ApplicationController
  def index
    translations = {
      en: {
        microposts: {
          image_size_alert: "Maximum file size is %{max_size}MB. Please choose a smaller file."
        }
      },
      vi: {
        microposts: {
          image_size_alert: "Kích thước tối đa là %{max_size}MB. Vui lòng chọn tệp nhỏ hơn."
        }
      }
    }

    # Get translations for current locale, fallback to English
    current_translations = translations[I18n.locale.to_sym] || translations[:en]

    # Add CORS headers to allow JavaScript to access the JSON
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Content-Type'] = 'application/json'

    # Return translations in the format expected by i18n-js
    render json: { [I18n.locale.to_s => current_translations] }
  end
end
