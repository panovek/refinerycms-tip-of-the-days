Refinery::User.find_each do |user|
  user.plugins.where(name: 'refinerycms-tip_of_the_days').first_or_create!(
    position: (user.plugins.maximum(:position) || -1) +1
  )
end if defined?(Refinery::User)