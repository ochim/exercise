require 'fileutils'

Dir.chdir("../reports")
directories = Dir.entries(Dir.pwd)

directories.each do |directory|

	if directory.length > 7 && directory[-1] =~ /[0-9]/
		year = directory[0..3]
		month = directory[4..5]
		day = directory[6..7]
		path = year + "/" + month + "/" + day
		puts path

		FileUtils.mkdir_p(path)

		filelist = Dir.entries(directory)
		filelist.each do |filename|

			if filename[0] =~ /\w/
				source = directory + "/" + filename
				puts source
				FileUtils.cp(source, path)
			end
		end

	end
end
