module RemoteTerminal
  class SSH
    def run(server, remote_directory, cmd)
      IO.popen("ssh #{server} 'cd #{remote_directory} && #{cmd}'") do |f|
        return "#{f.readlines.join()}"
      end
    end
  end
end