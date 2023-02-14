class SyncRegion 
  def run 
    Star.where("location is not null and location <> '' and region is null").limit(5000).each do |star|
      region = Geocoder.search(star.location)&.first&.country
      if region.present?
        Star.where(repo_id: star.repo_id, user_id: star.user_id).update_all(region: region) 
      else
        Star.where(repo_id: star.repo_id, user_id: star.user_id).update_all(region: 'N/A') 
      end
    end
  end
end