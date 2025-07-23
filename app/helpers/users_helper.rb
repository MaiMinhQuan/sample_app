module UsersHelper
  DEFAULT_GRAVATAR_SIZE = 50

  def gravatar_for user, options = {size: DEFAULT_GRAVATAR_SIZE}
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag gravatar_url, alt: user.name, class: "gravatar"
  end

  def gender_options selected = nil
    options_for_select(
      [
        [t("users.gender.female"), :female],
        [t("users.gender.male"), :male],
        [t("users.gender.other"), :other]
      ],
      selected
    )
  end

  def can_delete_user? user_to_delete
    current_user&.admin? && !current_user?(user_to_delete)
  end
end
