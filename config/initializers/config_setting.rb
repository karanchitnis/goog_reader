if Rails.env == "production"
	GOOGLE_CLIENT_ID = "777421625643.apps.googleusercontent.com"
	GOOGLE_CLIENT_SECRET = "szjNg_mC_Poufog4LqN9Ymav"
elsif Rails.env == "development"
	GOOGLE_CLIENT_ID = "193612616698.apps.googleusercontent.com"
	GOOGLE_CLIENT_SECRET = "xMKA2IqaGQWRBXygWe8OeqQf"
end