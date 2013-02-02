module RemoteTerminal
  class SSH
    def run(server, remote_directory, cmd)
      IO.popen("ssh #{server} 'cd #{remote_directory} && #{cmd}'") do |f|
        output = f.gets
        while output
          puts output
          output = f.gets
        end
      end
      return ""
    end
  end
end