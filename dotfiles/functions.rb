def ip_information
	system("ifconfig > /tmp/ifconfig.tmp")
	f=File.new("/tmp/ifconfig.tmp")
	@ip_info={}
	begin
		while line = f.readline
			get_info line
		end
	rescue EOFError
		f.close
	end
	@ip_info[:range] = @ip_info[:ip].split(".")[0..2].join(".") + ".X"
	@ip_info
end

def get_info(line)
	@ip_info[:ip] = line.scan(/inet addr:(.*?)  B/).join if line =~ /inet addr:.*?  B/ && !(line =~ /inet addr:127.0.0.1/)
end

def cleanup_tasks(rake)
	rake=rake.gsub("\n","\n\t")
	rake=rake.gsub(/\(in .*?\/.scripts\)/,"")
	rake=rake.gsub(/rake/,"dotscripts")
	rake
end
