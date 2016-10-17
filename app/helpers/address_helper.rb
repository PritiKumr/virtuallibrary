module AddressHelper
  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=318x180&zoom=17"
  end
end
