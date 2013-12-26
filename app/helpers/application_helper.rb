module ApplicationHelper
	def cp(path)
		"currentlink" if current_page?(path)
	end
end
