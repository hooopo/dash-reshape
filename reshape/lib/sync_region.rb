class SyncRegion 
  def run 
    Star.where("location is not null and location <> ''").each do |star|
      region = Geocoder.search(star.location)&.first&.country
      Star.where(repo_id: star.repo_id, user_id: star.user_id).update_all(region: region) if region.present?
    end
  end
end