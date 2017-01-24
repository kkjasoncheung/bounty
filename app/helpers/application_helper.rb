module ApplicationHelper

	def returnUser(id)
		if id
			u = User.find(id)
			return u.username
		end
	end

	def CheckExpired(duration, created_at)
		now = DateTime.now.utc
		now = now.in_time_zone('Eastern Time (US & Canada)')
		expired_time = created_at + duration*60 # adding minutes on
		if now >= expired_time
			return true
		end
	end
end
