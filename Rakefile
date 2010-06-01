require 'yaml'

desc "Adds a File to the list"
task :add, :file do |t, args|
	begin
		yaml=YAML::load_file("dotfiles.yml")
	rescue 
		yaml={ "files" => [] }
	end
	yaml["files"].push(args[:file])
	File.open("dotfiles.yml", File::WRONLY|File::TRUNC|File::CREAT) { |out| YAML.dump(yaml, out) }
end

desc "Pulls all the files into this folder ready for commiting"
task :prepare do
	yaml=YAML::load_file("dotfiles.yml")
	`mkdir -p dotfiles`
	yaml["files"].each do |file|
		system("cp #{file} dotfiles/")
	end
end

desc "Deploys all the files back to where they came from"
task :deploy do
	yaml=YAML::load_file("dotfiles.yml")
	yaml["files"].each do |file|
		fname=file.gsub(/.*\/(.*?)/,"")
		dir=file.gsub(fname,"")
		system("mkdir -p #{dir}") unless dir == "~/"
		system("cp dotfiles/#{fname} #{file}")
	end	
end

desc "Removes a file"
task :remove, :file do |t, args|
	
end
