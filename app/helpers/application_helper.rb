module ApplicationHelper
	def cp(path)
		"currentlink" if current_page?(path)
	end
	def ccon(con)
		"currentlink" if params[:controller]==con
	end
end
